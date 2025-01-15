defmodule BudgetTracker.BudgetPlansFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `BudgetTracker.BudgetPlans` context.
  """

  @doc """
  Generate a budget_plan.
  """
  def budget_plan_fixture(attrs \\ %{}) do
    {:ok, budget_plan} =
      attrs
      |> Enum.into(%{
        description: "some description",
        duration_in_days: 42,
        started_form: ~N[2025-01-14 12:38:00]
      })
      |> BudgetTracker.BudgetPlans.create_budget_plan()

    budget_plan
  end
end
