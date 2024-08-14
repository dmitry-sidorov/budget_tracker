defmodule BudgetTrackerWeb.DebitAccountsLive do
  use BudgetTrackerWeb, :live_view

  embed_templates "components/*"

  attr :amount, :float, required: true
  attr :currency, :string, required: true
  attr :title, :string, required: true
  def account_card(assigns)

  def handle_event("add_income", _unsigned_params, socket) do
    IO.puts("Add income event!")
    socket = assign(socket, show_new_income_modal: true) |> dbg()
    {:noreply, socket}
  end

  def handle_event("add_payment", _unsigned_params, socket) do
    IO.puts("Add payment event!")
    {:noreply, socket}
  end

  def handle_event("add_debit_account", _unsigned_params, socket) do
    IO.puts("add_debit_account!")
    socket = assign(socket, show: true)
    {:noreply, socket}
  end

  @spec render(any()) :: Phoenix.LiveView.Rendered.t()
  def render(assigns) do
    assigns.show_new_income_modal |> dbg()

    ~H"""
    <div class="flex flex-col items-center gap-5">
      <.link patch={~p"/debit_accounts/new"}>
        <.button phx-click="add_debit_account">Add new debit account</.button>
      </.link>
      <div class="mx-auto max-w-sm flex flex-col items-center gap-5">
        <.account_card amount={50.0} currency="USD" title="Запас" />
        <.account_card amount={500.0} currency="BYN" title="Текущий аккаунт" />
      </div>
      <.modal id="debit-account-modal" show={@show}>
        <div>Add new payment</div>
      </.modal>
    </div>
    """
  end

  def mount(_params, _session, socket) do
    socket =
      assign(socket, show_new_payment_modal: false)
      |> assign(show_new_income_modal: false)
      |> assign(show: false)

    {:ok, socket}
  end
end
