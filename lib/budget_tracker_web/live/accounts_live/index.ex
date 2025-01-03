defmodule BudgetTrackerWeb.DebitAccountsLive.List do
  alias BudgetTrackerWeb.AccountsLive.Components.AccountCard
  alias BudgetTracker.DebitAccounts
  use BudgetTrackerWeb, :live_view

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
    </div>
    """
  end

  def mount(_params, _session, socket) do
    socket = assign(socket, debit_accounts: DebitAccounts.list_debit_accounts())

    {:ok, socket}
  end
end
