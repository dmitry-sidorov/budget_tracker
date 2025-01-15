defmodule BudgetTracker.BudgetPlans.BudgetPlan do
  alias BudgetTracker.Accounts.User
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "budget_plans" do
    field :description, :string
    field :started_form, :naive_datetime
    field :duration_in_days, :integer
    belongs_to :users, User

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(budget_plan, attrs) do
    budget_plan
    |> cast(attrs, [:started_form, :duration_in_days, :description])
    |> validate_required([:started_form, :duration_in_days, :description])
  end
end
