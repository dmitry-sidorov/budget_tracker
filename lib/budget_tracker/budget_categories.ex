defmodule BudgetTracker.BudgetCategories do
  @moduledoc """
  The BudgetCategories context.
  """

  import Ecto.Query, warn: false
  alias BudgetTracker.Repo

  alias BudgetTracker.BudgetCategories.BudgetCategory

  @doc """
  Returns the list of budget_categories.

  ## Examples

      iex> list_budget_categories()
      [%BudgetCategory{}, ...]

  """
  def list_budget_categories do
    Repo.all(BudgetCategory)
  end

  @doc """
  Gets a single budget_category.

  Raises `Ecto.NoResultsError` if the Budget category does not exist.

  ## Examples

      iex> get_budget_category!(123)
      %BudgetCategory{}

      iex> get_budget_category!(456)
      ** (Ecto.NoResultsError)

  """
  def get_budget_category!(id), do: Repo.get!(BudgetCategory, id)

  @doc """
  Creates a budget_category.

  ## Examples

      iex> create_budget_category(%{field: value})
      {:ok, %BudgetCategory{}}

      iex> create_budget_category(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_budget_category(attrs \\ %{}) do
    %BudgetCategory{}
    |> BudgetCategory.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a budget_category.

  ## Examples

      iex> update_budget_category(budget_category, %{field: new_value})
      {:ok, %BudgetCategory{}}

      iex> update_budget_category(budget_category, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_budget_category(%BudgetCategory{} = budget_category, attrs) do
    budget_category
    |> BudgetCategory.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a budget_category.

  ## Examples

      iex> delete_budget_category(budget_category)
      {:ok, %BudgetCategory{}}

      iex> delete_budget_category(budget_category)
      {:error, %Ecto.Changeset{}}

  """
  def delete_budget_category(%BudgetCategory{} = budget_category) do
    Repo.delete(budget_category)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking budget_category changes.

  ## Examples

      iex> change_budget_category(budget_category)
      %Ecto.Changeset{data: %BudgetCategory{}}

  """
  def change_budget_category(%BudgetCategory{} = budget_category, attrs \\ %{}) do
    BudgetCategory.changeset(budget_category, attrs)
  end
end
