defmodule BudgetTracker.BudgetCategories.BudgetCategory do
  use Ecto.Schema
  import Ecto.Changeset

  alias BudgetTracker.{
    BudgetPlans.BudgetPlan,
    Currencies.Currency,
    OperationCategories.OperationCategory
  }

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "budget_categories" do
    field :limit, :float
    belongs_to :budget_plan, BudgetPlan
    belongs_to :operation_category, OperationCategory
    belongs_to :currency, Currency

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(budget_category, attrs) do
    budget_category
    |> cast(attrs, [:limit])
    |> validate_required([:limit])
  end
end
