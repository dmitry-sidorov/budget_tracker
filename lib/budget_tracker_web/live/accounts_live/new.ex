defmodule BudgetTrackerWeb.NewDebitAccountLive do
  alias BudgetTracker.DebitAccounts.DebitAccount
  alias BudgetTracker.DebitAccounts
  use BudgetTrackerWeb, :live_view
  alias BudgetTracker.Currencies

  def render(assigns) do
    ~H"""
    <div class="mx-auto max-w-sm">
      <.simple_form for={@form} phx-submit="create_debit_account">
        <.input field={@form[:title]} type="text" label="Title" required />
        <.input field={@form[:type]} type="select" label="Type" required options={["card", "cash"]} />
        <.input field={@form[:amount]} type="text" label="Initial amount" required />
        <.input
          field={@form[:currency]}
          type="select"
          label="Currency"
          required
          options={@currency_options}
        />
        <:actions>
          <.button color="success" class="w-full">
            Create
          </.button>
          <.link patch={~p"/debit_accounts"}>
            <.button color="danger" class="w-full">
              Cancel
            </.button>
          </.link>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  def handle_event("create_debit_account", %{"debit_account" => debit_account}, socket) do
    {currency_id, debit_account_params} = Map.pop!(debit_account, "currency")
    currency = Currencies.get_currency!(currency_id)
    current_user = socket.assigns.current_user
    last_update_date = DateTime.now!("Etc/UTC") |> DateTime.to_date()
    debit_account_params = debit_account_params |> Map.put("last_update", last_update_date)

    DebitAccounts.create_debit_account(
      current_user,
      currency,
      debit_account_params
    )

    {:noreply, socket}
  end

  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign(
        :form,
        to_form(%{"title" => nil, "type" => "card", "amount" => 0, "currency" => "USD"},
          as: "debit_account"
        )
      )
      |> assign(
        :currency_options,
        Currencies.list_currencies()
        |> Enum.map(fn currency -> [key: currency.title, value: currency.id] end)
      )

    {:ok, socket}
  end
end
