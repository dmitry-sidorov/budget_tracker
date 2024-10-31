defmodule BudgetTrackerWeb.NewDebitAccountLive do
  use BudgetTrackerWeb, :live_view

  def render(assigns) do
    assigns |> dbg()

    ~H"""
    <div class="mx-auto max-w-sm">
      <.simple_form for={@form}>
        <.input field={@form[:title]} type="text" label="Title" required />
        <.input field={@form[:type]} type="select" label="Type" required options={["card", "cash"]} />
        <.input field={@form[:amount]} type="text" label="Initial amount" required />
        <.input
          field={@form[:currency]}
          type="select"
          label="Currency"
          required
          options={["USD", "BYN", "EUR"]}
        />
        <:actions>
          <.button color="success" phx-disable-with="Sending..." class="w-full">
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

  def mount(_params, _session, socket) do
    socket =
      assign(
        socket,
        :form,
        to_form(%{"title" => nil, "type" => "card", "amount" => 0, "currency" => "USD"},
          as: "debit_account"
        )
      )
      |> dbg()

    {:ok, socket}
  end
end
