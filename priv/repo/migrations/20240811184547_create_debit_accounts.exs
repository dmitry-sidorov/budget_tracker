defmodule BudgetTracker.Repo.Migrations.CreateDebitAccounts do
  use Ecto.Migration

  def change do
    execute("CREATE TYPE debit_account_type AS ENUM ('card', 'cash')")

    create table(:debit_accounts, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :title, :string
      add :last_update, :date
      add :amount, :float
      add :currency_id, references(:currencies, on_delete: :nothing, type: :binary_id)
      add :user_id, references(:users, on_delete: :nothing, type: :binary_id)
      add :type, :debit_account_type

      timestamps(type: :utc_datetime)
    end

    create index(:debit_accounts, [:currency_id])
    create index(:debit_accounts, [:user_id])
  end
end
