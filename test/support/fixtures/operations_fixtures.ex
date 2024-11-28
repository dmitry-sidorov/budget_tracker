defmodule BudgetTracker.OperationsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `BudgetTracker.Operations` context.
  """

  @doc """
  Generate a operation.
  """
  def operation_fixture(attrs \\ %{}) do
    {:ok, operation} =
      attrs
      |> Enum.into(%{
        amount: 120.5,
        type: "some type"
      })
      |> BudgetTracker.Operations.create_operation()

    operation
  end
end
