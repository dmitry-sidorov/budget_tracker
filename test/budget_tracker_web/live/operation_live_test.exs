defmodule BudgetTrackerWeb.OperationLiveTest do
  use BudgetTrackerWeb.ConnCase

  import Phoenix.LiveViewTest
  import BudgetTracker.OperationsFixtures

  @create_attrs %{type: "some type", amount: 120.5}
  @update_attrs %{type: "some updated type", amount: 456.7}
  @invalid_attrs %{type: nil, amount: nil}

  defp create_operation(_) do
    operation = operation_fixture()
    %{operation: operation}
  end

  describe "Index" do
    setup [:create_operation]

    test "lists all operations", %{conn: conn, operation: operation} do
      {:ok, _index_live, html} = live(conn, ~p"/operations")

      assert html =~ "Listing Operations"
      assert html =~ operation.type
    end

    test "saves new operation", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/operations")

      assert index_live |> element("a", "New Operation") |> render_click() =~
               "New Operation"

      assert_patch(index_live, ~p"/operations/new")

      assert index_live
             |> form("#operation-form", operation: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#operation-form", operation: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/operations")

      html = render(index_live)
      assert html =~ "Operation created successfully"
      assert html =~ "some type"
    end

    test "updates operation in listing", %{conn: conn, operation: operation} do
      {:ok, index_live, _html} = live(conn, ~p"/operations")

      assert index_live |> element("#operations-#{operation.id} a", "Edit") |> render_click() =~
               "Edit Operation"

      assert_patch(index_live, ~p"/operations/#{operation}/edit")

      assert index_live
             |> form("#operation-form", operation: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#operation-form", operation: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/operations")

      html = render(index_live)
      assert html =~ "Operation updated successfully"
      assert html =~ "some updated type"
    end

    test "deletes operation in listing", %{conn: conn, operation: operation} do
      {:ok, index_live, _html} = live(conn, ~p"/operations")

      assert index_live |> element("#operations-#{operation.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#operations-#{operation.id}")
    end
  end

  describe "Show" do
    setup [:create_operation]

    test "displays operation", %{conn: conn, operation: operation} do
      {:ok, _show_live, html} = live(conn, ~p"/operations/#{operation}")

      assert html =~ "Show Operation"
      assert html =~ operation.type
    end

    test "updates operation within modal", %{conn: conn, operation: operation} do
      {:ok, show_live, _html} = live(conn, ~p"/operations/#{operation}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Operation"

      assert_patch(show_live, ~p"/operations/#{operation}/show/edit")

      assert show_live
             |> form("#operation-form", operation: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#operation-form", operation: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/operations/#{operation}")

      html = render(show_live)
      assert html =~ "Operation updated successfully"
      assert html =~ "some updated type"
    end
  end
end
