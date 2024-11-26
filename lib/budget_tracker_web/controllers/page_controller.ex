defmodule BudgetTrackerWeb.PageController do
  alias BudgetTracker.Accounts.User
  use BudgetTrackerWeb, :controller

  def home(%{assigns: %{current_user: nil}} = conn, _params) do
    render(conn, :home, layout: false)
  end

  def home(%{assigns: %{current_user: %User{}}} = conn, _params) do
    redirect(conn, to: ~p"/debit_accounts")
  end
end
