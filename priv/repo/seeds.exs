# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     BudgetTracker.Repo.insert!(%BudgetTracker.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

defmodule DatabaseSeeds do
  alias BudgetTracker.Currencies
  alias BudgetTracker.Repo

  def call(data_folder_path \\ "priv/repo/seeds") do
    seed_currencies!(data_folder_path)
  end

  defp seed_currencies!(path) do
    load_seed_data(path, "currencies")
    |> Enum.each(&Currencies.create_currency/1)
  end

  defp load_seed_data(path, entity) do
    "#{path}/#{entity}.json"
    |> File.read!()
    |> Jason.decode!(keys: :atoms)
  end
end

DatabaseSeeds.call()
