defmodule BudgetTracker.Repo.Migrations.UpdateUser do
  use Ecto.Migration

  def change do
    execute("CREATE TYPE user_role AS ENUM ('admin', 'member', 'guest')")

    alter table(:users) do
      add :first_name, :string
      add :last_name, :string
      add :gender, :string
      add :birthdate, :naive_datetime
      add :role, :user_role
    end
  end
end
