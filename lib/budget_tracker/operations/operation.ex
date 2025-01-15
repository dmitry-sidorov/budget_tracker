defmodule BudgetTracker.Operations.Operation do
  @moduledoc """
    Model of operation with money.
    Income is an operation with type :increase
    Payment is an operation with type :decrease
    Transfer from one debit account to another is a transaction of two: income + payment.
  """
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
    field :action, Ecto.Enum, values: [:increase, :decrease]
    field :type, Ecto.Enum, values: [:real, :planned]
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
