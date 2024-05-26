defmodule BudgetTracker.Repo.Migrations.CreateOperationCategories do
  use Ecto.Migration

  def change do
    create table(:operation_categories, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :title, :string
      add :is_primary, :boolean, default: false, null: false

      timestamps(type: :utc_datetime)
    end
  end
end
