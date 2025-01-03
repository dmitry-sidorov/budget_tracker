defmodule BudgetTrackerWeb.DebitAccountsLive do
  alias BudgetTrackerWeb.AccountsLive.Components.AccountCard
  alias BudgetTracker.DebitAccounts
  use BudgetTrackerWeb, :live_view

  # embed_templates "components/*"

  @new_income_modal_name "new-income-modal"
  @new_payment_modal_name "new-payment-modal"

  def handle_event("on_income", unsigned_params, socket) do
    IO.puts("Add income event!")
    unsigned_params
    socket = assign(socket, income_modal_visible?: true)
    socket = assign(socket, debit_account_id: unsigned_params["payload"])
    {:noreply, socket}
  end

  def handle_event(@new_payment_modal_name, unsigned_params, socket) do
    IO.puts("Add payment event!")
    show_modal(%JS{}, "new-payment-modal")
    socket = assign(socket, debit_account_id: unsigned_params["payload"])
    {:noreply, socket}
  end

  def handle_event("add_debit_account", _unsigned_params, socket) do
    IO.puts("add_debit_account!")
    socket = assign(socket, show: true)
    {:noreply, socket}
  end

  def handle_event("on_delete_account", unsigned_params, socket) do
    IO.puts("delete_debit_account!")
    unsigned_params
    {:noreply, socket}
  end

  def render(assigns) do
    ~H"""
    <div class="flex flex-col items-center gap-5">
      <div class="mx-auto max-w-sm flex flex-col items-center gap-5">
        <.live_component
          :for={account <- @debit_accounts}
          module={AccountCard}
          amount={account.amount}
          currency={account.currency.title}
          title={account.title}
          debit_account_id={account.id}
          id={account.id}
        />
        <.link patch={~p"/debit_accounts/new"}>
          <.button color="primary" phx-click="add_debit_account">Add new debit account</.button>
        </.link>
      </div>
      <%!-- TODO: merge income and payment forms and move it to operations live page --%>
      <.modal title="New income" id={@new_income_modal_name}>
        <.simple_form for={@new_income_form}>
          <.input_field field={@new_income_form[:title]} type="text" label="Title" required />
          <.input field={@new_income_form[:amount]} type="text" label="Initial amount" required />
          <.input field={@new_income_form[:currency]} disabled label="Currency" required />
          <.input field={@new_income_form[:target]} disabled label="Target" required />
          <.input
            field={@new_income_form[:date]}
            type="datetime-local"
            disabled
            label="Date"
            required
          />
          <:actions>
            <.button color="success" phx-submit="" class="w-full">
              Add new income
            </.button>
            <.button
              color="danger"
              phx-disable-with="Sending..."
              class="w-full"
              phx-click={hide_modal(@new_income_modal_name)}
            >
              Cancel
            </.button>
          </:actions>
        </.simple_form>
      </.modal>
      <.modal rounded="medium" title="New payment" id="new-payment-modal">
        <.simple_form for={@new_payment_form}>
          <.input field={@new_payment_form[:title]} type="text" label="Title" required />
          <.input field={@new_payment_form[:amount]} type="text" label="Initial amount" required />
          <.input field={@new_payment_form[:currency]} disabled label="Currency" required />
          <.input field={@new_payment_form[:source]} disabled label="Source" required />
          <.input
            field={@new_payment_form[:date]}
            type="datetime-local"
            disabled
            label="Date"
            required
          />
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
    </div>
    """
  end

  def mount(_params, _session, socket) do
    # DebitAccounts.list_debit_accounts() |> dbg()

    socket =
      assign(socket, show_new_payment_modal: false)
      |> assign(show_new_income_modal: false)
      |> assign(debit_account_id: nil)
      |> assign(new_income_modal_name: @new_income_modal_name)
      |> assign(new_payment_modal_name: @new_payment_modal_name)
      |> assign(income_modal_visible?: false)
      |> assign(
        :new_income_form,
        to_form(
          %{
            "title" => nil,
            "amount" => 0,
            "currency" => "USD",
            "target" => "Текущий счёт",
            "date" => DateTime.utc_now()
          },
          as: "debit_account"
        )
      )
      |> assign(
        :new_payment_form,
        to_form(
          %{
            "title" => nil,
            "amount" => 0,
            "currency" => "USD",
            "source" => "Тот счёт",
            "date" => DateTime.utc_now(),
            "category" => "Groceries"
          },
          as: "debit_account"
        )
      )
      |> assign(show: false)
      |> assign(debit_accounts: DebitAccounts.list_debit_accounts())

    {:ok, socket}
  end
end
