defmodule BudgetTracker.BudgetCategoriesTest do
  use BudgetTracker.DataCase

  alias BudgetTracker.BudgetCategories

  describe "budget_categories" do
    alias BudgetTracker.BudgetCategories.BudgetCategory

    import BudgetTracker.BudgetCategoriesFixtures

    @invalid_attrs %{limit: nil}

    test "list_budget_categories/0 returns all budget_categories" do
      budget_category = budget_category_fixture()
      assert BudgetCategories.list_budget_categories() == [budget_category]
    end

    test "get_budget_category!/1 returns the budget_category with given id" do
      budget_category = budget_category_fixture()
      assert BudgetCategories.get_budget_category!(budget_category.id) == budget_category
    end

    test "create_budget_category/1 with valid data creates a budget_category" do
      valid_attrs = %{limit: 120.5}

      assert {:ok, %BudgetCategory{} = budget_category} = BudgetCategories.create_budget_category(valid_attrs)
      assert budget_category.limit == 120.5
    end

    test "create_budget_category/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = BudgetCategories.create_budget_category(@invalid_attrs)
    end

    test "update_budget_category/2 with valid data updates the budget_category" do
      budget_category = budget_category_fixture()
      update_attrs = %{limit: 456.7}

      assert {:ok, %BudgetCategory{} = budget_category} = BudgetCategories.update_budget_category(budget_category, update_attrs)
      assert budget_category.limit == 456.7
    end

    test "update_budget_category/2 with invalid data returns error changeset" do
      budget_category = budget_category_fixture()
      assert {:error, %Ecto.Changeset{}} = BudgetCategories.update_budget_category(budget_category, @invalid_attrs)
      assert budget_category == BudgetCategories.get_budget_category!(budget_category.id)
    end

    test "delete_budget_category/1 deletes the budget_category" do
      budget_category = budget_category_fixture()
      assert {:ok, %BudgetCategory{}} = BudgetCategories.delete_budget_category(budget_category)
      assert_raise Ecto.NoResultsError, fn -> BudgetCategories.get_budget_category!(budget_category.id) end
    end

    test "change_budget_category/1 returns a budget_category changeset" do
      budget_category = budget_category_fixture()
      assert %Ecto.Changeset{} = BudgetCategories.change_budget_category(budget_category)
    end
  end
end
