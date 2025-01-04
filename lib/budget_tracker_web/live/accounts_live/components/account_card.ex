defmodule BudgetTrackerWeb.AccountsLive.Components.AccountCard do
  @moduledoc """
    LiveComponent for Debit Account Card
  """
  use BudgetTrackerWeb, :live_component

  alias BudgetTracker.DebitAccounts

  @income_event "income_event"
  @payment_event "payment_event"
  @delete_event "delete_event"

  def handle_event(@income_event, _unsigned_params, socket) do
    IO.puts("[LIVE COMPONENT] Add income event!")
    # socket = assign(socket, visible: true)
    # socket = assign(socket, debit_account_id: unsigned_params["payload"])
    {:noreply, socket}
  end

  def handle_event(@payment_event, _unsigned_params, socket) do
    IO.puts("[LIVE COMPONENT] Add payment event!")
    # socket = assign(socket, debit_account_id: unsigned_params["payload"])
    {:noreply, socket}
  end

  def handle_event(@delete_event, %{"id" => id}, socket) do
    IO.puts("[LIVE COMPONENT] Delete account event!")
    # debit_account = DebitAccounts.get_debit_account!(id)
    # {:ok, _} = DebitAccounts.delete_debit_account(debit_account)

    {:noreply, socket}
  end

  def mount(socket) do
    socket =
      assign(socket,
        event_names: %{income: @income_event, payment: @payment_event, delete: @delete_event}
      )

    {:ok, socket}
  end

  attr :amount, :float, required: true
  attr :currency, :string, required: true
  attr :title, :string, required: true
  attr :debit_account_id, :integer, default: 999
  attr :phx_click, :string
  attr :on_delete_callback_name, :string, required: true

  def render(assigns) do
    ~H"""
    <div>
      <.card class="box-content flex items-center border-1 border-black h-36 w-fit rounded-xl bg-slate-200">
        <.link patch={~p"/debit_accounts/show/#{@debit_account_id}"}>
          <div class="flex flex-col ml-5 min-w-36 sm:min-w-72 max-w-96 shrink">
            <span
              :for={
                {name, value} <- [{"Account", @title}, {"Amount", @amount}, {"Currency", @currency}]
              }
              class="flex flex-col sm:flex-row sm:gap-1"
            >
              <span class="font-bold">{name}:</span>
              <span>{value}</span>
            </span>
          </div>
        </.link>
        <div class="flex flex-col gap-3 mr-5">
          <.button
            color="success"
            class="h-12 w-36 rounded-lg"
            phx-click={@event_names.income}
            phx-target={@myself}
          >
            +1 Income
          </.button>
          <.button
            color="info"
            class="h-12 w-36 rounded-lg"
            phx-click={@event_names.payment}
            phx-target={@myself}
          >
            +1 Payment
          </.button>
        </div>
        <div
          class="mr-4 cursor-pointer"
          phx-click={@event_names.delete}
          phx-target={@myself}
          phx-value-id={@debit_account_id}
        >
          <.delete_icon />
        </div>
        <.modal id="delete_popup" title={"Do you want to delete account #{@title}?"}>
          <:actions>
            <.button
              color="danger"
              phx-submit="Delete"
              phx-click={show_modal("delete_popup")}
              class="w-full"
            >
              Delete category
            </.button>
            <.button
              color="danger"
              phx-disable-with="Sending..."
              class="w-full"
              phx-click={hide_modal("delete_popup")}
            >
              Cancel
            </.button>
          </:actions>
        </.modal>
      </.card>
    </div>
    """
  end
end
