defmodule BudgetTrackerWeb.Components.Indicator do
  @moduledoc """
  The `BudgetTrackerWeb.Components.Indicator` module provides a versatile component for visually highlighting
  specific areas or elements in your Phoenix application.

  It is designed to display small, circular indicators that can be used for notifications,
  status updates, or visual cues on UI elements.

  This component supports various sizes and colors and can be positioned in multiple areas
  relative to its parent element. Additionally, it has an optional ping animation for drawing
  attention to a specific point on the interface.

  The indicator can be used in diverse scenarios, such as showing the number of unread messages,
  indicating active states, or displaying connectivity status. It is customizable with different
  styles, making it adaptable to various design needs.
  """

  use Phoenix.Component

  @sizes ["extra_small", "small", "medium", "large", "extra_large"]

  @colors [
    "white",
    "primary",
    "secondary",
    "dark",
    "success",
    "warning",
    "danger",
    "info",
    "light",
    "misc",
    "dawn"
  ]

  @indicator_positions [
    "top_left",
    "top_center",
    "top_right",
    "middle_left",
    "middle_right",
    "bottom_left",
    "bottom_center",
    "bottom_right"
  ]

  @doc """
  Renders an `indicator` component with customizable size, color, and position.

  The indicator can be positioned around its parent element and supports various sizes and styles.

  ## Examples

  ```elixir
  <.indicator />
  <.indicator color="misc" />
  <.indicator size="extra_small" />
  <.indicator color="warning" size="extra_small" bottom_left />
  ```
  """
  @doc type: :component
  attr :id, :string,
    default: nil,
    doc: "A unique identifier is used to manage state and interaction"

  attr :size, :string,
    values: @sizes,
    default: "small",
    doc:
      "Determines the overall size of the elements, including padding, font size, and other items"

  attr :class, :string, default: nil, doc: "Custom CSS class for additional styling"
  attr :color, :string, values: @colors, default: "primary", doc: "Determines color theme"

  attr :border, :string,
    values: @colors ++ ["none"],
    default: "none",
    doc: "Determines border style"

  attr :rest, :global,
    include: ["pinging"] ++ @indicator_positions,
    doc:
      "Global attributes can define defaults which are merged with attributes provided by the caller"

  def indicator(%{rest: %{top_left: true}} = assigns) do
    ~H"""
    <span
      id={@id}
      class={[
        indicator_size(@size),
        color_class(@color),
        border_class(@border),
        "indicator block rounded-full border absolute -translate-y-1/2 -translate-x-1/2 right-auto top-0 left-0 indicator-top-left",
        !is_nil(@rest[:pinging]) && "animate-ping",
        @class
      ]}
      {drop_rest(@rest)}
    />
    """
  end

  def indicator(%{rest: %{top_center: true}} = assigns) do
    ~H"""
    <span
      id={@id}
      class={[
        indicator_size(@size),
        color_class(@color),
        border_class(@border),
        "indicator block rounded-full border absolute top-0 -translate-y-1/2 translate-x-1/2 right-1/2",
        !is_nil(@rest[:pinging]) && "animate-ping",
        @class
      ]}
      {drop_rest(@rest)}
    />
    """
  end

  def indicator(%{rest: %{top_right: true}} = assigns) do
    ~H"""
    <span
      id={@id}
      class={[
        indicator_size(@size),
        color_class(@color),
        border_class(@border),
        "indicator block rounded-full border absolute -translate-y-1/2 translate-x-1/2 left-auto top-0 right-0  indicator-top-right",
        !is_nil(@rest[:pinging]) && "animate-ping",
        @class
      ]}
      {drop_rest(@rest)}
    />
    """
  end

  def indicator(%{rest: %{middle_left: true}} = assigns) do
    ~H"""
    <span
      id={@id}
      class={[
        indicator_size(@size),
        color_class(@color),
        border_class(@border),
        "indicator block rounded-full border absolute -translate-y-1/2 -translate-x-1/2 right-auto left-0 top-2/4",
        !is_nil(@rest[:pinging]) && "animate-ping",
        @class
      ]}
      {drop_rest(@rest)}
    />
    """
  end

  def indicator(%{rest: %{middle_right: true}} = assigns) do
    ~H"""
    <span
      id={@id}
      class={[
        indicator_size(@size),
        color_class(@color),
        border_class(@border),
        "indicator block rounded-full border absolute -translate-y-1/2 translate-x-1/2 left-auto right-0 top-2/4",
        !is_nil(@rest[:pinging]) && "animate-ping",
        @class
      ]}
      {drop_rest(@rest)}
    />
    """
  end

  def indicator(%{rest: %{bottom_left: true}} = assigns) do
    ~H"""
    <span
      id={@id}
      class={[
        indicator_size(@size),
        color_class(@color),
        border_class(@border),
        "indicator block rounded-full border absolute translate-y-1/2 -translate-x-1/2 right-auto bottom-0 left-0  indicator-bottom-left",
        !is_nil(@rest[:pinging]) && "animate-ping",
        @class
      ]}
      {drop_rest(@rest)}
    />
    """
  end

  def indicator(%{rest: %{bottom_center: true}} = assigns) do
    ~H"""
    <span
      id={@id}
      class={[
        indicator_size(@size),
        color_class(@color),
        border_class(@border),
        "indicator block rounded-full border absolute translate-y-1/2 translate-x-1/2 bottom-0 right-1/2",
        !is_nil(@rest[:pinging]) && "animate-ping",
        @class
      ]}
      {drop_rest(@rest)}
    />
    """
  end

  def indicator(%{rest: %{bottom_right: true}} = assigns) do
    ~H"""
    <span
      id={@id}
      class={[
        indicator_size(@size),
        color_class(@color),
        border_class(@border),
        "indicator block rounded-full border absolute translate-y-1/2 translate-x-1/2 left-auto bottom-0 right-0  indicator-bottom-right",
        !is_nil(@rest[:pinging]) && "animate-ping",
        @class
      ]}
      {drop_rest(@rest)}
    />
    """
  end

  def indicator(assigns) do
    ~H"""
    <span
      id={@id}
      class={[
        indicator_size(@size),
        color_class(@color),
        border_class(@border),
        "block indicator rounded-full border",
        !is_nil(@rest[:pinging]) && "animate-ping",
        @class
      ]}
      {drop_rest(@rest)}
    />
    """
  end

  defp indicator_size("extra_small"), do: "!size-2"

  defp indicator_size("small"), do: "!size-2.5"

  defp indicator_size("medium"), do: "!size-3"

  defp indicator_size("large"), do: "!size-3.5"

  defp indicator_size("extra_large"), do: "!size-4"

  defp indicator_size(params) when is_binary(params), do: params
  defp indicator_size(nil), do: nil

  defp color_class("white"), do: "bg-white"

  defp color_class("primary"), do: "bg-[#4363EC]"

  defp color_class("secondary"), do: "bg-[#6B6E7C]"

  defp color_class("success"), do: "bg-[#047857]"

  defp color_class("warning"), do: "bg-[#FF8B08]"

  defp color_class("danger"), do: "bg-[#E73B3B]"

  defp color_class("info"), do: "bg-[#004FC4]"

  defp color_class("misc"), do: "bg-[#52059C]"

  defp color_class("dawn"), do: "bg-[#4D4137]"

  defp color_class("light"), do: "bg-[#707483]"

  defp color_class("dark"), do: "bg-[#1E1E1E]"

  defp border_class("white"), do: "border-white"

  defp border_class("primary"), do: "border-[#4363EC]"

  defp border_class("secondary"), do: "border-[#6B6E7C]"

  defp border_class("success"), do: "border-[#047857]"

  defp border_class("warning"), do: "border-[#FF8B08]"

  defp border_class("danger"), do: "border-[#E73B3B]"

  defp border_class("info"), do: "border-[#004FC4]"

  defp border_class("misc"), do: "border-[#52059C]"

  defp border_class("dawn"), do: "border-[#4D4137]"

  defp border_class("light"), do: "border-[#707483]"

  defp border_class("dark"), do: "border-[#1E1E1E]"

  defp border_class(type) when type in ["none"], do: "border-transparent"

  defp drop_rest(rest) do
    all_rest =
      (["pinging"] ++ @indicator_positions)
      |> Enum.map(&if(is_binary(&1), do: String.to_atom(&1), else: &1))

    Map.drop(rest, all_rest)
  end
end
