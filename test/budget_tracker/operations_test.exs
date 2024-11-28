defmodule BudgetTracker.OperationsTest do
  use BudgetTracker.DataCase

  alias BudgetTracker.Operations

  describe "operations" do
    alias BudgetTracker.Operations.Operation

    import BudgetTracker.OperationsFixtures

    @invalid_attrs %{type: nil, amount: nil}

    test "list_operations/0 returns all operations" do
      operation = operation_fixture()
      assert Operations.list_operations() == [operation]
    end

    test "get_operation!/1 returns the operation with given id" do
      operation = operation_fixture()
      assert Operations.get_operation!(operation.id) == operation
    end

    test "create_operation/1 with valid data creates a operation" do
      valid_attrs = %{type: "some type", amount: 120.5}

      assert {:ok, %Operation{} = operation} = Operations.create_operation(valid_attrs)
      assert operation.type == "some type"
      assert operation.amount == 120.5
    end

    test "create_operation/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Operations.create_operation(@invalid_attrs)
    end

    test "update_operation/2 with valid data updates the operation" do
      operation = operation_fixture()
      update_attrs = %{type: "some updated type", amount: 456.7}

      assert {:ok, %Operation{} = operation} = Operations.update_operation(operation, update_attrs)
      assert operation.type == "some updated type"
      assert operation.amount == 456.7
    end

    test "update_operation/2 with invalid data returns error changeset" do
      operation = operation_fixture()
      assert {:error, %Ecto.Changeset{}} = Operations.update_operation(operation, @invalid_attrs)
      assert operation == Operations.get_operation!(operation.id)
    end

    test "delete_operation/1 deletes the operation" do
      operation = operation_fixture()
      assert {:ok, %Operation{}} = Operations.delete_operation(operation)
      assert_raise Ecto.NoResultsError, fn -> Operations.get_operation!(operation.id) end
    end

    test "change_operation/1 returns a operation changeset" do
      operation = operation_fixture()
      assert %Ecto.Changeset{} = Operations.change_operation(operation)
    end
  end
end
