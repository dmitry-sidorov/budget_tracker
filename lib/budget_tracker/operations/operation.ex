defmodule BudgetTracker.Operations.Operation do
  use Ecto.Schema
  import Ecto.Changeset

  alias BudgetTracker.{
    Currencies.Currency,
    Accounts.User,
    DebitAccounts.DebitAccount,
    OperationCategories.OperationCategory,
    Currencies.Currency
  }

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "operations" do
    field :type, Ecto.Enum, values: [:increase, :descrease]
    field :amount, :float
    belongs_to :user, User
    belongs_to :debit_account, DebitAccount
    belongs_to :operation_category, OperationCategory
    belongs_to :currency, Currency

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(operation, attrs) do
    operation
    |> cast(attrs, [:type, :amount])
    |> validate_required([:type, :amount])
  end
end