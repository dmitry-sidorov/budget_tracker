defmodule BudgetTrackerWeb.NewDebitAccountLive do
  use BudgetTrackerWeb, :live_view

  def render(assigns) do
    assigns |> dbg()

    ~H"""
    <.simple_form for={@form}>
      <.input
        field={@form[:debit_account].title}
        type="text"
        placeholder="Debit account title"
        required
      />
      <:actions>
        <.button phx-disable-with="Sending..." class="w-full">
          Resend confirmation instructions
        </.button>
      </:actions>
    </.simple_form>
    """
  end

  def mount(_params, _session, socket) do
    socket = assign(socket, :form, to_form(%{"title" => nil}, as: "debit_account")) |> dbg()
    {:ok, socket}
  end
end
