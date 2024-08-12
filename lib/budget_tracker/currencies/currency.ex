defmodule BudgetTracker.Currencies.Currency do
  alias BudgetTracker.DebitAccounts.DebitAccount
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "currencies" do
    field :title, :string
    has_many :debit_account, DebitAccount

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(currency, attrs) do
    currency
    |> cast(attrs, [:title])
    |> validate_required([:title])
  end
end
