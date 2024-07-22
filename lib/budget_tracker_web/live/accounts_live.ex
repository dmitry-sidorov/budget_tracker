defmodule BudgetTrackerWeb.AccountsLive do
  use BudgetTrackerWeb, :live_view

  def render(assigns) do
    ~H"""
    <div class="mx-auto max-w-sm">
      Welcome to Accounts page!
    </div>
    """
  end

  def mount(_params, _session, socket) do
    {:ok, socket}
  end
end
