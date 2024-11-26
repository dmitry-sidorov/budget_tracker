defmodule BudgetTrackerWeb.CategoriesLive.Show do
  use BudgetTrackerWeb, :live_view
  alias BudgetTracker.OperationCategories

  @create_category_modal "create_category_modal"

  def mount(_params, _session, socket) do
    categories = OperationCategories.list_operation_categories()

    socket =
      socket
      |> assign(categories: categories)
      |> assign(create_category_modal: @create_category_modal)
      |> assign(new_category_form: to_form(%{}))
      |> assign(show_modal: false)

    {:ok, socket}
  end

  def handle_event("create_category", unsigned_params, socket) do
    # unsigned_params |> dbg()

    {:noreply, socket}
  end

  def render(assigns) do
    assigns.categories |> dbg()

    ~H"""
    <.button color="primary" phx-click={show_modal(@create_category_modal)}>
      Create category
    </.button>
    <.table
      color="white"
      header_border="extra_small"
      cols_border="extra_small"
      rows_border="extra_small"
    >
      <:header class="bg-slate-200">Title</:header>
      <:header class="bg-slate-200">Purpose</:header>
      <.tr :for={category <- @categories}>
        <.td><%= category.title %></.td>
        <.td><%= category.purpose %></.td>
      </.tr>
    </.table>
    <.modal title="New income" id={@create_category_modal}>
      <.simple_form for={@new_category_form}>
        <.input_field field={@new_category_form[:title]} type="text" label="Title" required />
        <.input
          field={@new_category_form[:purpose]}
          type="select"
          options={[Primary: "primary", Secondary: "secondary"]}
          label="Purpose"
          required
        />
        <:actions>
          <.button color="success" phx-submit="create_category" class="w-full">
            Create category
          </.button>
          <.button
            color="danger"
            phx-disable-with="Sending..."
            class="w-full"
            phx-click={hide_modal(@create_category_modal)}
          >
            Cancel
          </.button>
        </:actions>
      </.simple_form>
    </.modal>
    """
  end
end
