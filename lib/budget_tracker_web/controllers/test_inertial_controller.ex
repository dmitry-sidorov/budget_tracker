defmodule BudgetTrackerWeb.TestInertialController do
  use BudgetTrackerWeb, :controller

  def index(conn, _params) do
    conn
    |> assign_prop(:text, "Hello world")
    |> render_inertia("TestPage")
  end
end
