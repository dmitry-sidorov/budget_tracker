defmodule BudgetTrackerWeb.OperationLive.FormComponent do
  use BudgetTrackerWeb, :live_component

  alias BudgetTracker.Operations

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage operation records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="operation-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:type]} type="text" label="Type" />
        <.input field={@form[:amount]} type="number" label="Amount" step="any" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Operation</.button>
        </:actions>
      </.simple_form>
    </div>
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
