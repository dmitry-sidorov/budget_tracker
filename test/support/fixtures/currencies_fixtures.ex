defmodule BudgetTracker.CurrenciesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `BudgetTracker.Currencies` context.
  """

  @doc """
  Generate a currency.
  """
  def currency_fixture(attrs \\ %{}) do
    {:ok, currency} =
      attrs
      |> Enum.into(%{
        title: "some title"
      })
      |> BudgetTracker.Currencies.create_currency()

    currency
  end
end
