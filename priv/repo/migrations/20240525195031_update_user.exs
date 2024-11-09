defmodule BudgetTracker.Repo.Migrations.UpdateUser do
  use Ecto.Migration

  def change do
    create_type(:user_role, [:admin, :member])
    create_type(:user_gender, [:male, :female, :other])

    alter table(:users) do
      add :first_name, :string
      add :last_name, :string
      add :gender, :string
      add :birthdate, :naive_datetime
      add :role, :user_role
      add :gender, :user_gender
    end
  end
end
