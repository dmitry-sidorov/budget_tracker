defmodule BudgetTracker.Repo.Migrations.CreateBudgetPlans do
  use Ecto.Migration

  def change do
    create table(:budget_plans, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :started_form, :naive_datetime
      add :duration_in_days, :integer
      add :description, :text
      add :user_id, references(:users, on_delete: :nothing, type: :binary_id)

      timestamps(type: :utc_datetime)
    end

    create index(:budget_plans, [:user_id])
  end
end
