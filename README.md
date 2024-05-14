# BudgetTracker

To start your Phoenix server:

- Create database container `docker run --name budget_tracker_dev -p 5432:5432 -e POSTGRES_USER=bd_tracker -e POSTGRES_PASSWORD=bd_tracker -d postgres`
- Run `mix setup` to install and setup dependencies
- Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:5005`](http://localhost:5005) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).
