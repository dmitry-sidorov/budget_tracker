defmodule BudgetTrackerWeb.DebitAccountsLive do
  use BudgetTrackerWeb, :live_view

  embed_templates "components/*"

  @new_income_modal_name "new-income-modal"
  @new_payment_modal_name "new-payment-modal"

  attr :amount, :float, required: true
  attr :currency, :string, required: true
  attr :title, :string, required: true
  attr :debit_account_id, :integer, default: 999
  attr :new_income_modal_name, :string, default: @new_income_modal_name
  attr :new_payment_modal_name, :string, default: @new_payment_modal_name
  def account_card(assigns)

  def handle_event("add_income", unsigned_params, socket) do
    IO.puts("Add income event!")
    unsigned_params |> dbg()
    socket = assign(socket, debit_account_id: unsigned_params["payload"])
    {:noreply, socket}
  end

  def handle_event("add_payment", unsigned_params, socket) do
    IO.puts("Add payment event!")
    socket = assign(socket, debit_account_id: unsigned_params["payload"])
    {:noreply, socket}
  end

  def handle_event("add_debit_account", _unsigned_params, socket) do
    IO.puts("add_debit_account!")
    socket = assign(socket, show: true)
    {:noreply, socket}
  end

  def render(assigns) do
    ~H"""
    <div class="flex flex-col items-center gap-5">
      <.link patch={~p"/debit_accounts/new"}>
        <.button phx-click="add_debit_account">Add new debit account</.button>
      </.link>
      <div class="mx-auto max-w-sm flex flex-col items-center gap-5">
        <.account_card amount={50.0} currency="USD" title="Запас" debit_account_id={42} />
        <.account_card
          amount={500.0}
          currency="BYN"
          title="Текущий аккаунт"
          debit_account_id={999}
        />
      </div>
      <.modal id={@new_income_modal_name}>
        <div>Add new income id: (<%= @debit_account_id %>)</div>
      </.modal>
      <.modal id={@new_payment_modal_name}>
        <div>Add new payment id: (<%= @debit_account_id %>)</div>
      </.modal>
    </div>
    """
  end

  def mount(_params, _session, socket) do
    socket =
      assign(socket, show_new_payment_modal: false)
      |> assign(show_new_income_modal: false)
      |> assign(debit_account_id: nil)
      |> assign(new_income_modal_name: @new_income_modal_name)
      |> assign(new_payment_modal_name: @new_payment_modal_name)
      |> assign(show: false)

    {:ok, socket}
  end
end
