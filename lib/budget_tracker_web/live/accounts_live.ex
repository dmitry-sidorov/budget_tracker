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
        <.button class="h-12 w-48 bg-emerald-500">Add new income</.button>
        <.button class="h-12 w-48 bg-blue-500">Add new payment</.button>
      </div>
    </div>
    """
  end

  def render(assigns) do
    ~H"""
    <div class="mx-auto max-w-sm flex flex-col items-center gap-10">
      <.account />
      <.account />
    </div>
    """
  end

  def mount(_params, _session, socket) do
    {:ok, socket}
  end
end
