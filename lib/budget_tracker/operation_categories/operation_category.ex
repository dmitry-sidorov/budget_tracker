defmodule BudgetTracker.OperationCategories.OperationCategory do
  use Ecto.Schema
  import Ecto.Changeset
  alias BudgetTracker.Operations.Operation

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "operation_categories" do
    field :title, :string
    field :purpose, Ecto.Enum, values: [:primary, :secondary, :not_mandatory]
    has_many :operations, Operation

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(operation_category, attrs) do
    operation_category
    |> cast(attrs, [:title, :purpose])
    |> validate_required([:title, :purpose])
  end
end
