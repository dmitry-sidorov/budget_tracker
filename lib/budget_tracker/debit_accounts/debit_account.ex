defmodule BudgetTracker.DebitAccounts.DebitAccount do
  @moduledoc """
  Debit account shows current amount of money in proper currency.
  User can have multiple debit accounts, of course.
  """
  alias BudgetTracker.{Currencies.Currency, Accounts.User, Operations.Operation}
  use Ecto.Schema
  import Ecto.Changeset

  @type_values [:card, :cash, :deposit, :saving]

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "debit_accounts" do
    field :title, :string
    field :last_update, :date
    field :amount, :float
    field :type, Ecto.Enum, values: @type_values
    belongs_to :user, User
    belongs_to :currency, Currency
    has_many :operations, Operation

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(debit_account, attrs) do
    debit_account
    |> cast(attrs, [:title, :last_update, :amount, :type])
    |> validate_required([:title, :last_update, :amount, :type])
  end

  def get_field_values(:type), do: @type_values
end
