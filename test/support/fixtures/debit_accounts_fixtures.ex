defmodule BudgetTracker.DebitAccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `BudgetTracker.DebitAccounts` context.
  """

  @doc """
  Generate a debit_account.
  """
  def debit_account_fixture(attrs \\ %{}) do
    {:ok, debit_account} =
      attrs
      |> Enum.into(%{
        amount: 120.5,
        last_update: ~D[2024-08-10],
        title: "some title"
      })
      |> BudgetTracker.DebitAccounts.create_debit_account()

    debit_account
  end
end
