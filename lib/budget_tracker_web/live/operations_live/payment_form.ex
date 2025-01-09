defmodule BudgetTrackerWeb.OperationsLive.PaymentForm do
  use BudgetTrackerWeb, :live_view

  alias BudgetTracker.Operations

  @impl true
  def render(assigns) do
    ~H"""
    <.modal id={@popup_name} title="New payment">
      <.simple_form for={@new_payment_form}>
        <.input field={@new_payment_form[:title]} type="text" label="Title" required />
        <.input field={@new_payment_form[:amount]} type="text" label="Initial amount" required />
        <.input field={@new_payment_form[:currency]} disabled label="Currency" required />
        <.input field={@new_payment_form[:source]} disabled label="Source" required />
        <.input field={@new_payment_form[:date]} type="datetime-local" disabled label="Date" required />
        <.input
          type="select"
          field={@new_income_form[:category]}
          label="Category"
          options={["Groceries", "Auto"]}
        />
        <:actions>
          <.button color="success" phx-disable-with="Sending..." class="w-full" purpose={:primary}>
            Add new payment
          </.button>
          <.button color="danger" class="w-full" phx-click={hide_modal(@new_payment_modal_name)}>
            Cancel
          </.button>
        </:actions>
      </.simple_form>
    </.modal>
    """
  end

  @impl true
  def update(%{operation: operation} = assigns, socket) do
    {:ok,
     socket
     |> assign(assigns)
     |> assign_new(:form, fn ->
       to_form(Operations.change_operation(operation))
     end)}
  end

  @impl true
  def handle_event("validate", %{"operation" => operation_params}, socket) do
    changeset = Operations.change_operation(socket.assigns.operation, operation_params)
    {:noreply, assign(socket, form: to_form(changeset, action: :validate))}
  end

  def handle_event("save", %{"operation" => operation_params}, socket) do
    save_operation(socket, socket.assigns.action, operation_params)
  end

  defp save_operation(socket, :edit, operation_params) do
    case Operations.update_operation(socket.assigns.operation, operation_params) do
      {:ok, operation} ->
        notify_parent({:saved, operation})

        {:noreply,
         socket
         |> put_flash(:info, "Operation updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp save_operation(socket, :new, operation_params) do
    case Operations.create_operation(operation_params) do
      {:ok, operation} ->
        notify_parent({:saved, operation})

        {:noreply,
         socket
         |> put_flash(:info, "Operation created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
