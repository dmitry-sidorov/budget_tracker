defmodule BudgetTrackerWeb.Components.Footer do
  @moduledoc """
  The `BudgetTrackerWeb.Components.Footer` module provides a customizable footer component for Phoenix applications,
  allowing for various styles, colors, and layout options. It supports different design variants
  such as default, outline, transparent, shadow, and unbordered.

  ### Features:

  - **Customizable Styles:** Choose from multiple color themes and design variants.
  - **Flexible Layouts:** Control text positioning, spacing, padding, and border styles.
  - **Responsive Design:** Set max width and rounded corners for adaptive layouts.
  - **Global Attributes Support:** Allows for additional attributes to be merged with component defaults.

  This component is designed to enhance the appearance and functionality of footers in web applications.
  """

  use Phoenix.Component

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

  @variants [
    "default",
    "outline",
    "transparent",
    "shadow",
    "unbordered"
  ]

  @doc """
  Renders a customizable `footer` component with different sections and styling options, allowing
  for the inclusion of text, links, and other content.

  ## Examples

  ```elixir
  <.footer color="secondary" padding="large" space="medium">
    <.footer_section class="border-b" padding="small">Mishka Chelekom</.footer_section>

    <.footer_section class="grid grid-cols-3 gap-2 justify-between" padding="large">
      <.list color="secondary">
        <:item><a href="/">Home</a></:item>
        <:item><a href="/">Contact</a></:item>
        <:item><a href="/">About</a></:item>
      </.list>

      <.list color="secondary" style="list-disc">
        <:item>list</:item>
        <:item>list</:item>
        <:item>list</:item>
      </.list>

      <div>
        Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an
        unknown printer took a galley of type and scrambled it to make a type specimen bookged.
      </div>
    </.footer_section>

    <.footer_section text_position="center" class="border-t" padding="small">
      © 2023 Mishka Chelekom
    </.footer_section>
  </.footer>
  ```
  """
  @doc type: :component
  attr :id, :string,
    default: nil,
    doc: "A unique identifier is used to manage state and interaction"

  attr :variant, :string, values: @variants, default: "default", doc: "Determines the style"
  attr :color, :string, values: @colors, default: "white", doc: "Determines color theme"
  attr :border, :string, default: "extra_small", doc: "Determines border style"
  attr :text_position, :string, default: nil, doc: "Determines the element' text position"
  attr :rounded, :string, default: nil, doc: "Determines the border radius"
  attr :max_width, :string, default: nil, doc: "Determines the style of element max width"
  attr :space, :string, default: nil, doc: "Space between items"

  attr :font_weight, :string,
    default: "font-normal",
    doc: "Determines custom class for the font weight"

  attr :padding, :string, default: "none", doc: "Determines padding for items"
  attr :class, :string, default: nil, doc: "Custom CSS class for additional styling"

  attr :rest, :global,
    doc:
      "Global attributes can define defaults which are merged with attributes provided by the caller"

  slot :inner_block, required: false, doc: "Inner block that renders HEEx content"

  def footer(assigns) do
    ~H"""
    <footer
      id={@id}
      class={[
        border_class(@border),
        color_variant(@variant, @color),
        rounded_size(@rounded),
        padding_size(@padding),
        text_position(@text_position),
        maximum_width(@max_width),
        space_class(@space),
        @font_weight,
        @class
      ]}
      {@rest}
    >
      <div>
        <%= render_slot(@inner_block) %>
      </div>
    </footer>
    """
  end

  @doc """
  Renders a section within a footer component, allowing for customized text alignment, spacing, and styling.

  ## Examples

  ```elixir
  <.footer_section class="border-b" padding="small">Mishka Chelekom</.footer_section>
  ```
  """
  @doc type: :component
  attr :class, :string, default: nil, doc: "Custom CSS class for additional styling"

  attr :font_weight, :string,
    default: "font-normal",
    doc: "Determines custom class for the font weight"

  attr :text_position, :string, default: nil, doc: "Determines the element' text position"
  attr :space, :string, default: nil, doc: "Space between items"
  attr :padding, :string, default: "none", doc: "Determines padding for items"
  slot :inner_block, required: false, doc: "Inner block that renders HEEx content"

  def footer_section(assigns) do
    ~H"""
    <div class={[
      padding_size(@padding),
      text_position(@text_position),
      space_class(@space),
      @font_weight,
      @class
    ]}>
      <%= render_slot(@inner_block) %>
    </div>
    """
  end

  defp text_position("left"), do: "text-left"
  defp text_position("right"), do: "text-right"
  defp text_position("center"), do: "text-center"
  defp text_position(_), do: nil

  defp space_class("extra_small"), do: "space-y-2"

  defp space_class("small"), do: "space-y-3"

  defp space_class("medium"), do: "space-y-4"

  defp space_class("large"), do: "space-y-5"

  defp space_class("extra_large"), do: "space-y-6"

  defp space_class(params) when is_binary(params), do: params
  defp space_class(_), do: "space-y-0"

  defp maximum_width("extra_small"), do: "[&>div]:max-w-3xl	[&>div]:mx-auto"
  defp maximum_width("small"), do: "[&>div]:max-w-4xl [&>div]:mx-auto"
  defp maximum_width("medium"), do: "[&>div]:max-w-5xl [&>div]:mx-auto"
  defp maximum_width("large"), do: "[&>div]:max-w-6xl [&>div]:mx-auto"
  defp maximum_width("extra_large"), do: "[&>div]:max-w-7xl [&>div]:mx-auto"
  defp maximum_width(params) when is_binary(params), do: params
  defp maximum_width(_), do: nil

  defp padding_size("extra_small"), do: "p-1"

  defp padding_size("small"), do: "p-2"

  defp padding_size("medium"), do: "p-3"

  defp padding_size("large"), do: "p-4"

  defp padding_size("extra_large"), do: "p-5"

  defp padding_size("none"), do: "p-0"

  defp padding_size(params) when is_binary(params), do: params

  defp padding_size(_), do: padding_size("none")

  defp border_class("none"), do: "border-t-0"

  defp border_class("extra_small"), do: "border-t"

  defp border_class("small"), do: "border-t-2"

  defp border_class("medium"), do: "border-t-[3px]"

  defp border_class("large"), do: "border-t-4"

  defp border_class("extra_large"), do: "border-t-[5px]"

  defp border_class(params) when is_binary(params), do: params

  defp border_class(_), do: border_class("extra_small")

  defp rounded_size("extra_small"), do: "rounded-t-sm"

  defp rounded_size("small"), do: "rounded-t"

  defp rounded_size("medium"), do: "rounded-t-md"

  defp rounded_size("large"), do: "rounded-t-lg"

  defp rounded_size("extra_large"), do: "rounded-t-xl"

  defp rounded_size(params) when is_binary(params), do: params
  defp rounded_size(_), do: "rounded-t-none"

  defp color_variant("default", "white") do
    "bg-white text-[#3E3E3E] border-[#DADADA]"
  end

  defp color_variant("default", "primary") do
    "bg-[#4363EC] text-white border-[#2441de]"
  end

  defp color_variant("default", "secondary") do
    "bg-[#6B6E7C] text-white border-[#877C7C]"
  end

  defp color_variant("default", "success") do
    "bg-[#ECFEF3] text-[#047857] border-[#6EE7B7]"
  end

  defp color_variant("default", "warning") do
    "bg-[#FFF8E6] text-[#FF8B08] border-[#FF8B08]"
  end

  defp color_variant("default", "danger") do
    "bg-[#FFE6E6] text-[#E73B3B] border-[#E73B3B]"
  end

  defp color_variant("default", "info") do
    "bg-[#E5F0FF] text-[#004FC4] border-[#004FC4]"
  end

  defp color_variant("default", "misc") do
    "bg-[#FFE6FF] text-[#52059C] border-[#52059C]"
  end

  defp color_variant("default", "dawn") do
    "bg-[#FFECDA] text-[#4D4137] border-[#4D4137]"
  end

  defp color_variant("default", "light") do
    "bg-[#E3E7F1] text-[#707483] border-[#707483]"
  end

  defp color_variant("default", "dark") do
    "bg-[#1E1E1E] text-white border-[#050404]"
  end

  defp color_variant("outline", "white") do
    "bg-transparent text-white border-white"
  end

  defp color_variant("outline", "primary") do
    "bg-transparent text-[#4363EC] border-[#4363EC] "
  end

  defp color_variant("outline", "secondary") do
    "bg-transparent text-[#6B6E7C] border-[#6B6E7C]"
  end

  defp color_variant("outline", "success") do
    "bg-transparent text-[#227A52] border-[#6EE7B7]"
  end

  defp color_variant("outline", "warning") do
    "bg-transparent text-[#FF8B08] border-[#FF8B08]"
  end

  defp color_variant("outline", "danger") do
    "bg-transparent text-[#E73B3B] border-[#E73B3B]"
  end

  defp color_variant("outline", "info") do
    "bg-transparent text-[#004FC4] border-[#004FC4]"
  end

  defp color_variant("outline", "misc") do
    "bg-transparent text-[#52059C] border-[#52059C]"
  end

  defp color_variant("outline", "dawn") do
    "bg-transparent text-[#4D4137] border-[#4D4137]"
  end

  defp color_variant("outline", "light") do
    "bg-transparent text-[#707483] border-[#707483]"
  end

  defp color_variant("outline", "dark") do
    "bg-transparent text-[#1E1E1E] border-[#1E1E1E]"
  end

  defp color_variant("unbordered", "white") do
    "bg-white text-[#3E3E3E] border-transparent"
  end

  defp color_variant("unbordered", "primary") do
    "bg-[#4363EC] text-white border-transparent"
  end

  defp color_variant("unbordered", "secondary") do
    "bg-[#6B6E7C] text-white border-transparent"
  end

  defp color_variant("unbordered", "success") do
    "bg-[#ECFEF3] text-[#047857] border-transparent"
  end

  defp color_variant("unbordered", "warning") do
    "bg-[#FFF8E6] text-[#FF8B08] border-transparent"
  end

  defp color_variant("unbordered", "danger") do
    "bg-[#FFE6E6] text-[#E73B3B] border-transparent"
  end

  defp color_variant("unbordered", "info") do
    "bg-[#E5F0FF] text-[#004FC4] border-transparent"
  end

  defp color_variant("unbordered", "misc") do
    "bg-[#FFE6FF] text-[#52059C] border-transparent"
  end

  defp color_variant("unbordered", "dawn") do
    "bg-[#FFECDA] text-[#4D4137] border-transparent"
  end

  defp color_variant("unbordered", "light") do
    "bg-[#E3E7F1] text-[#707483] border-transparent"
  end

  defp color_variant("unbordered", "dark") do
    "bg-[#1E1E1E] text-white border-transparent"
  end

  defp color_variant("shadow", "white") do
    "bg-white text-[#3E3E3E] border-[#DADADA] shadow-[rgba(17,_17,_26,_0.1)_0px_0px_16px]"
  end

  defp color_variant("shadow", "primary") do
    "bg-[#4363EC] text-white border-[#4363EC] shadow-[rgba(17,_17,_26,_0.1)_0px_0px_16px]"
  end

  defp color_variant("shadow", "secondary") do
    "bg-[#6B6E7C] text-white border-[#6B6E7C] shadow-[rgba(17,_17,_26,_0.1)_0px_0px_16px]"
  end

  defp color_variant("shadow", "success") do
    "bg-[#AFEAD0] text-[#227A52] border-[#AFEAD0] shadow-[rgba(17,_17,_26,_0.1)_0px_0px_16px]"
  end

  defp color_variant("shadow", "warning") do
    "bg-[#FFF8E6] text-[#FF8B08] border-[#FFF8E6] shadow-[rgba(17,_17,_26,_0.1)_0px_0px_16px]"
  end

  defp color_variant("shadow", "danger") do
    "bg-[#FFE6E6] text-[#E73B3B] border-[#FFE6E6] shadow-[rgba(17,_17,_26,_0.1)_0px_0px_16px]"
  end

  defp color_variant("shadow", "info") do
    "bg-[#E5F0FF] text-[#004FC4] border-[#E5F0FF] shadow-[rgba(17,_17,_26,_0.1)_0px_0px_16px]"
  end

  defp color_variant("shadow", "misc") do
    "bg-[#FFE6FF] text-[#52059C] border-[#FFE6FF] shadow-[rgba(17,_17,_26,_0.1)_0px_0px_16px]"
  end

  defp color_variant("shadow", "dawn") do
    "bg-[#FFECDA] text-[#4D4137] border-[#FFECDA] shadow-[rgba(17,_17,_26,_0.1)_0px_0px_16px]"
  end

  defp color_variant("shadow", "light") do
    "bg-[#E3E7F1] text-[#707483] border-[#E3E7F1] shadow-[rgba(17,_17,_26,_0.1)_0px_0px_16px]"
  end

  defp color_variant("shadow", "dark") do
    "bg-[#1E1E1E] text-white border-[#1E1E1E] shadow-[rgba(17,_17,_26,_0.1)_0px_0px_16px]"
  end

  defp color_variant("transparent", "white") do
    "bg-transparent text-white border-transparent"
  end

  defp color_variant("transparent", "primary") do
    "bg-transparent text-[#4363EC] border-transparent"
  end

  defp color_variant("transparent", "secondary") do
    "bg-transparent text-[#6B6E7C] border-transparent"
  end

  defp color_variant("transparent", "success") do
    "bg-transparent text-[#227A52] border-transparent"
  end

  defp color_variant("transparent", "warning") do
    "bg-transparent text-[#FF8B08] border-transparent"
  end

  defp color_variant("transparent", "danger") do
    "bg-transparent text-[#E73B3B] border-transparent"
  end

  defp color_variant("transparent", "info") do
    "bg-transparent text-[#6663FD] border-transparent"
  end

  defp color_variant("transparent", "misc") do
    "bg-transparent text-[#52059C] border-transparent"
  end

  defp color_variant("transparent", "dawn") do
    "bg-transparent text-[#4D4137] border-transparent"
  end

  defp color_variant("transparent", "light") do
    "bg-transparent text-[#707483] border-transparent"
  end

  defp color_variant("transparent", "dark") do
    "bg-transparent text-[#1E1E1E] border-transparent"
  end
end
