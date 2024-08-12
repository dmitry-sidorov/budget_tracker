defmodule BudgetTrackerWeb.AccountsLive do
  use BudgetTrackerWeb, :live_view

  embed_templates "components/*"

  attr :amount, :float, required: true
  attr :currency, :string, required: true
  attr :title, :string, required: true
  def account_card(assigns)

  def handle_event("add_income", _unsigned_params, socket) do
    IO.puts("Add income event!")
    socket = assign(socket, show_new_income_modal: true)
    {:noreply, socket}
  end

  def handle_event("add_payment", _unsigned_params, socket) do
    IO.puts("Add payment event!")
    {:noreply, socket}
  end

  def render(assigns) do
    ~H"""
    <div class="mx-auto max-w-sm flex flex-col items-center gap-5">
      <.account_card amount={50.0} currency="USD" title="Запас" />
      <.account_card amount={500.0} currency="BYN" title="Текущий аккаунт" />
    </div>
    <.modal id="add-payment-modal" show={assigns.show_new_income_modal}>
      <div>Add new payment</div>
    </.modal>
    """
  end

  def mount(_params, _session, socket) do
    socket =
      assign(socket, show_new_payment_modal: false)
      |> assign(show_new_income_modal: false)

    {:ok, socket}
  end
end
