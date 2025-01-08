defmodule BudgetTrackerWeb.OperationsLive.Index do
  use BudgetTrackerWeb, :live_view

  alias BudgetTracker.Operations
  alias BudgetTracker.Operations.Operation

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :operations, Operations.list_operations())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Operation")
    |> assign(:operation, Operations.get_operation!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Operation")
    |> assign(:operation, %Operation{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Operations")
    |> assign(:operation, nil)
  end

  @impl true
  def handle_info({BudgetTrackerWeb.OperationLive.FormComponent, {:saved, operation}}, socket) do
    {:noreply, stream_insert(socket, :operations, operation)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    operation = Operations.get_operation!(id)
    {:ok, _} = Operations.delete_operation(operation)

    {:noreply, stream_delete(socket, :operations, operation)}
  end
end
