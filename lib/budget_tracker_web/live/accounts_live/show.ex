defmodule BudgetTrackerWeb.DebitAccountsLive.Show do
  alias BudgetTrackerWeb.AccountsLive.Components.AccountCard
  alias BudgetTracker.DebitAccounts
  use BudgetTrackerWeb, :live_view

  def render(assigns) do
    ~H"""
    <div class="flex flex-col items-center gap-5">
      <div class="mx-auto max-w-sm flex flex-col items-center gap-5">
        <%!-- TODO: make layout pretty --%>
        <div>Title: {@debit_account.title}</div>
        <div>Amount: {@debit_account.amount}</div>
        <div>Currency: {@debit_account.currency.title}</div>
      </div>
    </div>
    """
  end

  def handle_params(%{"id" => id}, _uri, socket) do
    debit_account = DebitAccounts.get_debit_account!(id)
    socket = socket |> assign(debit_account: debit_account) |> dbg()
    {:noreply, socket}
  end
end
