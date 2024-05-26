defmodule BudgetTracker.OperationCategories.OperationCategory do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "operation_categories" do
    field :title, :string
    field :is_primary, :boolean, default: false

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(operation_category, attrs) do
    operation_category
    |> cast(attrs, [:title, :is_primary])
    |> validate_required([:title, :is_primary])
  end
end
