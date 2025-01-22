defmodule BudgetTracker.BudgetCategoriesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `BudgetTracker.BudgetCategories` context.
  """

  @doc """
  Generate a budget_category.
  """
  def budget_category_fixture(attrs \\ %{}) do
    {:ok, budget_category} =
      attrs
      |> Enum.into(%{
        limit: 120.5
      })
      |> BudgetTracker.BudgetCategories.create_budget_category()

    budget_category
  end
end
