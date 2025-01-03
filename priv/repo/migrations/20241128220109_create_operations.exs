defmodule BudgetTracker.Repo.Migrations.CreateOperations do
  use Ecto.Migration
  import EctoEnumMigration

  def change do
    create_type(:operation_type, [:increase, :decrease])

    create table(:operations, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :type, :operation_type
      add :amount, :float
      add :user_id, references(:users, on_delete: :nothing, type: :binary_id)
      add :debit_account_id, references(:debit_accounts, on_delete: :nothing, type: :binary_id)

      add :operation_category_id,
          references(:operation_categories, on_delete: :nothing, type: :binary_id)

      add :currency_id, references(:currencies, on_delete: :nothing, type: :binary_id)

      timestamps(type: :utc_datetime)
    end

    create index(:operations, [:user_id])
    create index(:operations, [:debit_account_id])
    create index(:operations, [:operation_category_id])
    create index(:operations, [:currency_id])
  end
end
