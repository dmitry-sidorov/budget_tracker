defmodule BudgetTracker.OperationCategoriesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `BudgetTracker.OperationCategories` context.
  """

  @doc """
  Generate a operation_category.
  """
  def operation_category_fixture(attrs \\ %{}) do
    {:ok, operation_category} =
      attrs
      |> Enum.into(%{
        is_primary: true,
        title: "some title"
      })
      |> BudgetTracker.OperationCategories.create_operation_category()

    operation_category
  end
end
