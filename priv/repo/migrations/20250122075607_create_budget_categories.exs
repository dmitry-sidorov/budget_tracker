defmodule BudgetTracker.Repo.Migrations.CreateBudgetCategories do
  use Ecto.Migration

  def change do
    create table(:budget_categories, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :limit, :float
      add :budget_plan_id, references(:budget_plans, on_delete: :nothing, type: :binary_id)
      add :category_id, references(:operation_categories, on_delete: :nothing, type: :binary_id)
      add :currency, references(:currencies, on_delete: :nothing, type: :binary_id)

      timestamps(type: :utc_datetime)
    end

    create index(:budget_categories, [:budget_plan_id])
    create index(:budget_categories, [:category_id])
    create index(:budget_categories, [:currency])
  end
end
