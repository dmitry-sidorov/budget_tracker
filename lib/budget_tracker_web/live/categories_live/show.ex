defmodule BudgetTrackerWeb.CategoriesLive.Show do
  alias BudgetTracker.OperationCategories.OperationCategory
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

  def handle_event("edit", unsigned_params, socket) do
    {:noreply, socket}
  end

  def handle_event("delete", unsigned_params, socket) do
    {:noreply, socket}
  end

  defp get_category_badge_color(%OperationCategory{purpose: purpose}) do
    case purpose do
      :primary -> "success"
      :secondary -> "info"
      :not_mandatory -> "dawn"
    end
  end

  defp get_category_purpose(%OperationCategory{purpose: purpose}) do
    Atom.to_string(purpose) |> String.replace("_", " ")
  end

  def render(assigns) do
    ~H"""
    <div class="flex flex-col gap-4">
      <.button class="w-48" color="primary" phx-click={show_modal(@create_category_modal)}>
        Create category
      </.button>
      <.table
        color="white"
        header_border="extra_small"
        cols_border="extra_small"
        rows_border="extra_small"
      >
        <:header :for={header_title <- ["Title", "Purpose", "Actions"]} class="bg-slate-200">
          <%= header_title %>
        </:header>
        <.tr :for={category <- @categories}>
          <.td>
            <%= category.title %>
          </.td>
          <.td>
            <.badge size="medium" color={get_category_badge_color(category)}>
              <%= get_category_purpose(category) %>
            </.badge>
          </.td>
          <.td class="flex gap-4">
            <div class="flex gap-4 w-8">
              <span class="my-auto cursor-pointer" phx-click="edit" phx-value-category={category.id}>
                <.edit_icon />
              </span>
              <span class="my-auto cursor-pointer" phx-click="delete" phx-value-category={category.id}>
                <.delete_icon />
              </span>
            </div>
          </.td>
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
    </div>
    """
  end
end
