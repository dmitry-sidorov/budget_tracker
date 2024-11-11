defmodule BudgetTracker.DebitAccountsTest do
  use BudgetTracker.DataCase

  alias BudgetTracker.DebitAccounts

  describe "debit_accounts" do
    alias BudgetTracker.DebitAccounts.DebitAccount

    import BudgetTracker.DebitAccountsFixtures

    @invalid_attrs %{title: nil, last_update: nil, amount: nil}

    test "list_debit_accounts/0 returns all debit_accounts" do
      debit_account = debit_account_fixture()
      assert DebitAccounts.list_debit_accounts() == [debit_account]
    end

    test "get_debit_account!/1 returns the debit_account with given id" do
      debit_account = debit_account_fixture()
      assert DebitAccounts.get_debit_account!(debit_account.id) == debit_account
    end

    test "create_debit_account/1 with valid data creates a debit_account" do
      valid_attrs = %{
        title: "some title",
        last_update: ~D[2024-08-10],
        amount: 120.5,
        type: "card"
      }

      assert {:ok, %DebitAccount{} = debit_account} =
               DebitAccounts.create_debit_account(valid_attrs)

      assert debit_account.title == "some title"
      assert debit_account.last_update == ~D[2024-08-10]
      assert debit_account.amount == 120.5
    end

    test "create_debit_account/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = DebitAccounts.create_debit_account(@invalid_attrs)
    end

    test "update_debit_account/2 with valid data updates the debit_account" do
      debit_account = debit_account_fixture()
      update_attrs = %{title: "some updated title", last_update: ~D[2024-08-11], amount: 456.7}

      assert {:ok, %DebitAccount{} = debit_account} =
               DebitAccounts.update_debit_account(debit_account, update_attrs)

      assert debit_account.title == "some updated title"
      assert debit_account.last_update == ~D[2024-08-11]
      assert debit_account.amount == 456.7
    end

    test "update_debit_account/2 with invalid data returns error changeset" do
      debit_account = debit_account_fixture()

      assert {:error, %Ecto.Changeset{}} =
               DebitAccounts.update_debit_account(debit_account, @invalid_attrs)

      assert debit_account == DebitAccounts.get_debit_account!(debit_account.id)
    end

    test "delete_debit_account/1 deletes the debit_account" do
      debit_account = debit_account_fixture()
      assert {:ok, %DebitAccount{}} = DebitAccounts.delete_debit_account(debit_account)

      assert_raise Ecto.NoResultsError, fn ->
        DebitAccounts.get_debit_account!(debit_account.id)
      end
    end

    test "change_debit_account/1 returns a debit_account changeset" do
      debit_account = debit_account_fixture()
      assert %Ecto.Changeset{} = DebitAccounts.change_debit_account(debit_account)
    end
  end
end
