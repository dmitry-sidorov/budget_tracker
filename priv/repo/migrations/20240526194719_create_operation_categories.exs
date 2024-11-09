defmodule BudgetTracker.Repo.Migrations.CreateOperationCategories do
  use Ecto.Migration
  import EctoEnumMigration

  def change do
    create_type(:operation_category_purpose, [:primary, :secondary])

    create table(:operation_categories, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :title, :string
      add :purpose, :operation_category_purpose

      timestamps(type: :utc_datetime)
    end
  end
end
