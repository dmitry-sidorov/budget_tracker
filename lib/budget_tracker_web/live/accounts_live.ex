defmodule BudgetTrackerWeb.AccountsLive do
  use BudgetTrackerWeb, :live_view

  def account(%{} = assigns) do
    ~H"""
    <div class="box-content flex items-center border-2 border-black h-36 w-fit rounded-xl">
      <div class="flex flex-col ml-5 w-72">
        <span class="w-48">Account: Текущий счёт</span>
        <span class="w-48">Amount: 50.0</span>
        <span class="w-48">Currency: USD</span>
      </div>
      <div class="flex gap-10 mr-5">
        <.button
          class="h-12 w-48 rounded-lg hover:bg-emerald-400"
          phx-click="add_income"
          purpose={:primary}
        >
          Add new income
        </.button>
        <.button class="h-12 w-48 rounded-lg" phx-click="add_payment" purpose={:secondary}>
          Add new payment
        </.button>
      </div>
    </div>
    """
  end

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
    <div class="mx-auto max-w-sm flex flex-col items-center gap-10">
      <.account />
      <.account />
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
