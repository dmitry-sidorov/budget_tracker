defmodule BudgetTracker.DebitAccounts.DebitAccount do
  alias BudgetTracker.{Currencies.Currency, Accounts.User}
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "debit_accounts" do
    field :title, :string
    field :last_update, :date
    field :amount, :float
    belongs_to :user, User
    has_one :currency, Currency

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(debit_account, attrs) do
    debit_account
    |> cast(attrs, [:title, :last_update, :amount])
    |> validate_required([:title, :last_update, :amount])
  end
end
