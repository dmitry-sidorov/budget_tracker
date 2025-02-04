defmodule BudgetTracker.OperationCategories.OperationCategory do
  @moduledoc """
    Category helps to separate operations by purpose and target of payment.
  """
  use Ecto.Schema
  import Ecto.Changeset
  alias BudgetTracker.{Operations.Operation, BudgetCategories.BudgetCategory}

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "operation_categories" do
    field :title, :string
    field :purpose, Ecto.Enum, values: [:primary, :secondary, :not_mandatory]
    has_many :operations, Operation
    has_many :budget_categories, BudgetCategory

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(operation_category, attrs) do
    operation_category
    |> cast(attrs, [:title, :purpose])
    |> validate_required([:title, :purpose])
  end
end
