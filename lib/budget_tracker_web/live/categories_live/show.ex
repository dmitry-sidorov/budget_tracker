defmodule BudgetTrackerWeb.CategoriesLive.Show do
  use BudgetTrackerWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, categories: [])}
  end

  def render(assigns) do
    ~H"""
    <div><%= @categories %></div>
    """
  end
end
