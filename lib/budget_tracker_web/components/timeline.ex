defmodule BudgetTrackerWeb.Components.Timeline do
  @moduledoc """
  The `BudgetTrackerWeb.Components.Timeline` module is a versatile and customizable component
  designed for displaying timeline-style content in Phoenix LiveView applications.

  It allows users to present chronological or sequential events in both horizontal and vertical formats.

  ### Features:
  - **Layout Options**: Supports both horizontal and vertical timeline orientations,
  providing flexibility in content presentation.
  - **Customizable Appearance**: Offers various attributes to modify the appearance of
  timeline sections, such as colors, line widths, and bullet sizes.
  - **Thematic Colors**: Includes multiple color themes like primary, secondary, success,
  warning, and more to match the design aesthetic.
  - **Bullet and Icon Support**: Provides options to include icons or images in place of the
  standard timeline bullets for enhanced visual representation.
  - **Slot-based Content**: Supports slot-based content insertion, allowing developers to include
  custom HTML or components within the timeline sections.
  - **Responsive Design**: Adapts to different screen sizes and orientations, ensuring a consistent
  user experience across devices.
  - **Flexible Styling**: Attributes like `gapped_sections` and `hide_last_line` offer additional
  control over the layout and visibility of timeline elements.

  This component integrates seamlessly into Phoenix LiveView applications, providing a rich
  and interactive way to visualize timelines, events, or progressions.
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
    "dawn",
    "silver"
  ]

  @doc """
  The `timeline` component provides a structured layout to display a sequence of events or actions,
  either horizontally or vertically.

  It can include various content, such as images and text, and supports customization options
  like color themes and spacing.

  ## Examples

  ```elixir
  <.timeline>
    <.timeline_section
      size="double_large"
      image="https://example.com/profile.jpg"
    >
      <.card padding="large" rounded="large">
        <div class="items-center justify-between">
          <time class="mb-1 text-xs font-normal text-gray-400 sm:order-last sm:mb-0">
            just now
          </time>
          <div class="text-sm font-normal text-gray-500">
            Bonnie moved
            <a href="#" class="font-semibold text-blue-600 dark:text-blue-500 hover:underline">
              Jese Leos
            </a>
            to
            <span class={[
              "bg-gray-100 text-gray-800 text-xs font-normal me-2 px-2.5 py-0.5 rounded",
              "dark:bg-gray-600 dark:text-gray-300"
            ]}>
              Funny Group
            </span>
          </div>
        </div>
      </.card>
    </.timeline_section>
    <.timeline_section
      size="double_large"
      image="https://example.com/profile.jpg"
    >
      <.card padding="large" rounded="large">
        <div class="items-center justify-between mb-3 sm:flex">
          <time class="mb-1 text-xs font-normal text-gray-400 sm:order-last sm:mb-0">
            2 hours ago
          </time>
          <div class="text-sm font-normal text-gray-500">
            Thomas Lean commented on
            <a href="#" class="font-semibold text-gray-900 hover:underline">Flowbite Pro</a>
          </div>
        </div>
        <div class="p-3 text-xs italic font-normal text-gray-500 border border-gray-200 rounded-lg bg-gray-50">
          Hi ya'll! I wanted to share a webinar zeroheight is having regarding how to
          best measure your design system! This is the second session of our new webinar
          series on #DesignSystems discussions where we'll be speaking about Measurement.
        </div>
      </.card>
    </.timeline_section>
  </.timeline>
  ```
  """
  @doc type: :component
  attr :id, :string,
    default: nil,
    doc: "A unique identifier is used to manage state and interaction"

  attr :color, :string, values: @colors, default: "silver", doc: "Determines color theme"
  attr :hide_last_line, :boolean, default: false, doc: ""
  attr :gapped_sections, :boolean, default: false, doc: ""
  attr :class, :string, default: nil, doc: "Custom CSS class for additional styling"

  attr :rest, :global,
    doc:
      "Global attributes can define defaults which are merged with attributes provided by the caller"

  attr :horizontal, :boolean, default: false, doc: "Determines whether element is horizontal"

  slot :inner_block, required: false, doc: "Inner block that renders HEEx content"

  def timeline(%{horizontal: true} = assigns) do
    ~H"""
    <div
      class={[
        "timeline-horizontal items-center sm:flex px-5 lg:px-0",
        color_class(@color)
      ]}
      {@rest}
    >
      <%= render_slot(@inner_block) %>
    </div>
    """
  end

  def timeline(assigns) do
    ~H"""
    <div
      class={[
        color_class(@color),
        @gapped_sections && "[&_.timeline-bullet-wrapper]:items-center",
        @hide_last_line && "[&_.timeline-section:last-child_.timeline-vertical-line]:after:hidden"
      ]}
      {@rest}
    >
      <%= render_slot(@inner_block) %>
    </div>
    """
  end

  @doc """
  The `timeline_section` component is used to define individual sections within a `Timeline`.

  It supports both vertical and horizontal layouts, and can include a title, time, description,
  and additional content. It also allows for custom icons or images to be displayed alongside
  each timeline section.

  ## Examples

  ```elixir
  <.timeline_section
    size="double_large"
    image="https://example.com/profile.jpg"
  >
    <.card padding="large" rounded="large">
      <div class="items-center justify-between mb-3 sm:flex">
        <time class="mb-1 text-xs font-normal text-gray-400 sm:order-last sm:mb-0">
          2 hours ago
        </time>
        <div class="text-sm font-normal text-gray-500">
          Thomas Lean commented on
          <a href="#" class="font-semibold text-gray-900 hover:underline">Flowbite Pro</a>
        </div>
      </div>
      <div class="p-3 text-xs italic font-normal text-gray-500 border border-gray-200 rounded-lg bg-gray-50">
        Hi ya'll! I wanted to share a webinar zeroheight is having regarding how to
        best measure your design system! This is the second session of our new webinar
        series on #DesignSystems discussions where we'll be speaking about Measurement.
      </div>
    </.card>
  </.timeline_section>
  ```
  """
  @doc type: :component
  attr :id, :string,
    default: nil,
    doc: "A unique identifier is used to manage state and interaction"

  attr :line_width, :string, default: "extra_small", doc: "Determines line width of timeline"

  attr :size, :string,
    default: "extra_small",
    doc:
      "Determines the overall size of the elements, including padding, font size, and other items"

  attr :bullet_icon, :string, default: nil, doc: "Determines bullet icon"
  attr :image, :string, default: nil, doc: "Image displayed alongside of an item"
  attr :title, :string, default: nil, doc: "Specifies the title of the element"
  attr :time, :string, default: nil, doc: "Specifies the time"
  attr :description, :string, default: nil, doc: "Determines a short description"
  attr :horizontal, :boolean, default: false, doc: "Determines whether element is horizontal"
  attr :class, :string, default: nil, doc: "Custom CSS class for additional styling"

  attr :rest, :global,
    doc:
      "Global attributes can define defaults which are merged with attributes provided by the caller"

  slot :inner_block, required: false, doc: "Inner block that renders HEEx content"

  def timeline_section(%{horizontal: true} = assigns) do
    ~H"""
    <div
      id={@id}
      class={[
        "timeline-section relative mb-6 sm:mb-0",
        @class
      ]}
      {@rest}
    >
      <div :if={!@image} class="flex items-center">
        <div class={[
          "timeline-bullet z-10 flex items-center justify-center rounded-full shrink-0",
          bullet_size(@size)
        ]}>
          <.icon :if={@bullet_icon} name={@bullet_icon} class="bullet-icon" />
        </div>
        <div class="timeline-horizontal-line hidden sm:flex w-full h-0.5"></div>
      </div>

      <div :if={@image} class="flex items-center">
        <div class={[
          "timeline-image-wrapper z-10 shrink-0",
          bullet_size(@size)
        ]}>
          <img class="rounded-full shadow-md" src={@image} alt={@image} />
        </div>
        <div class="timeline-horizontal-line hidden sm:flex w-full h-0.5"></div>
      </div>

      <div class="mt-3 sm:pe-5">
        <h3 :if={@title} class="text-lg font-semibold mb-2"><%= @title %></h3>
        <time :if={@time} class="block mb-3 text-xs font-normal leading-none"><%= @time %></time>
        <p :if={@description} class="text-sm"><%= @description %></p>

        <%= render_slot(@inner_block) %>
      </div>
    </div>
    """
  end

  def timeline_section(assigns) do
    ~H"""
    <div
      id={@id}
      class={[
        "timeline-section flex gap-x-3 [&_.timeline-vertical-line]:after:top-3",
        @class
      ]}
      {@rest}
    >
      <div
        :if={!@image}
        class={[
          "timeline-vertical-line relative after:absolute",
          "after:bottom-0 after:start-3.5 after:-translate-x-[0.5px]",
          line_width(@line_width)
        ]}
      >
        <div class="timeline-bullet-wrapper relative z-10 size-7 flex justify-center">
          <div class={[
            "timeline-bullet rounded-full flex justify-center items-center",
            bullet_size(@size)
          ]}>
            <.icon :if={@bullet_icon} name={@bullet_icon} class="bullet-icon" />
          </div>
        </div>
      </div>

      <div
        :if={@image}
        class={[
          "timeline-vertical-line relative after:absolute",
          "after:bottom-0 after:start-1/2 after:-translate-x-[0.5px] shrink-0",
          line_width(@line_width)
        ]}
      >
        <div class="relative z-10">
          <div class={[
            "timeline-image-wrapper",
            bullet_size(@size)
          ]}>
            <img class="rounded-full shadow-md" src={@image} alt={@image} />
          </div>
        </div>
      </div>

      <div class={[
        "grow pt-0.5 pb-5"
      ]}>
        <h3 :if={@title} class="text-lg font-semibold mb-2"><%= @title %></h3>
        <time :if={@time} class="block mb-3 text-xs font-normal leading-none"><%= @time %></time>
        <p :if={@description} class="text-sm"><%= @description %></p>

        <%= render_slot(@inner_block) %>
      </div>
    </div>
    """
  end

  defp line_width("extra_small"), do: "after:w-[0.031rem]"
  defp line_width("small"), do: "after:w-[0.063rem]"
  defp line_width("medium"), do: "after:w-[0.094rem]"
  defp line_width("large"), do: "after:w-[0.156rem]"
  defp line_width("extra_large"), do: "after:w-[0.188rem]"
  defp line_width(params) when is_binary(params), do: params
  defp line_width(_), do: line_width("extra_small")

  defp bullet_size("extra_small") do
    [
      "[&:not(.timeline-image-wrapper)]:size-2 [&_.bullet-icon]:size-1.5",
      "[&.timeline-image-wrapper>img]:size-6"
    ]
  end

  defp bullet_size("small") do
    [
      "[&:not(.timeline-image-wrapper)]:size-3 [&_.bullet-icon]:size-2",
      "[&.timeline-image-wrapper>img]:size-7"
    ]
  end

  defp bullet_size("medium") do
    [
      "[&:not(.timeline-image-wrapper)]:size-4 [&_.bullet-icon]:size-2",
      "[&.timeline-image-wrapper>img]:size-8"
    ]
  end

  defp bullet_size("large") do
    [
      "[&:not(.timeline-image-wrapper)]:size-[18px] [&_.bullet-icon]:size-2",
      "[&.timeline-image-wrapper>img]:size-9"
    ]
  end

  defp bullet_size("extra_large") do
    [
      "[&:not(.timeline-image-wrapper)]:size-5 [&_.bullet-icon]:size-3",
      "[&.timeline-image-wrapper>img]:size-10"
    ]
  end

  defp bullet_size("double_large") do
    [
      "[&:not(.timeline-image-wrapper)]:size-[22px] [&_.bullet-icon]:size-4",
      "[&.timeline-image-wrapper>img]:size-12"
    ]
  end

  defp bullet_size("triple_large") do
    [
      "[&:not(.timeline-image-wrapper)]:size-[25px] [&_.bullet-icon]:size-4",
      "[&.timeline-image-wrapper>img]:size-14"
    ]
  end

  defp bullet_size("quadruple_large") do
    [
      "[&:not(.timeline-image-wrapper)]:size-7 [&_.bullet-icon]:size-5",
      "[&.timeline-image-wrapper>img]:size-16"
    ]
  end

  defp bullet_size(params) when is_binary(params), do: params

  defp bullet_size(_), do: bullet_size("extra_small")

  defp color_class("silver") do
    [
      "[&_.timeline-bullet]:bg-[#DADADA] [&_.timeline-bullet]:text-[#3E3E3E] [&_.timeline-vertical-line]:after:bg-[#DADADA]",
      "[&_.timeline-horizontal-line]:bg-[#DADADA]"
    ]
  end

  defp color_class("primary") do
    [
      "[&_.timeline-bullet]:bg-[#2441de] [&_.timeline-bullet]:text-white [&_.timeline-vertical-line]:after:bg-[#2441de]",
      "[&_.timeline-horizontal-line]:bg-[#2441de]"
    ]
  end

  defp color_class("secondary") do
    [
      "[&_.timeline-bullet]:bg-[#877C7C] [&_.timeline-bullet]:text-white [&_.timeline-vertical-line]:after:bg-[#877C7C]",
      "[&_.timeline-horizontal-line]:bg-[#877C7C]"
    ]
  end

  defp color_class("success") do
    [
      "[&_.timeline-bullet]:bg-[#6EE7B7] [&_.timeline-bullet]:text-white [&_.timeline-vertical-line]:after:bg-[#6EE7B7]",
      "[&_.timeline-horizontal-line]:bg-[#6EE7B7]"
    ]
  end

  defp color_class("warning") do
    [
      "[&_.timeline-bullet]:bg-[#FF8B08] [&_.timeline-bullet]:text-white [&_.timeline-vertical-line]:after:bg-[#FF8B08]",
      "[&_.timeline-horizontal-line]:bg-[#FF8B08]"
    ]
  end

  defp color_class("danger") do
    [
      "[&_.timeline-bullet]:bg-[#E73B3B] [&_.timeline-bullet]:text-white [&_.timeline-vertical-line]:after:bg-[#E73B3B]",
      "[&_.timeline-horizontal-line]:bg-[#E73B3B]"
    ]
  end

  defp color_class("info") do
    [
      "[&_.timeline-bullet]:bg-[#004FC4] [&_.timeline-bullet]:text-white [&_.timeline-vertical-line]:after:bg-[#004FC4]",
      "[&_.timeline-horizontal-line]:bg-[#004FC4]"
    ]
  end

  defp color_class("misc") do
    [
      "[&_.timeline-bullet]:bg-[#52059C] [&_.timeline-bullet]:text-white [&_.timeline-vertical-line]:after:bg-[#52059C]",
      "[&_.timeline-horizontal-line]:bg-[#52059C]"
    ]
  end

  defp color_class("dawn") do
    [
      "[&_.timeline-bullet]:bg-[#4D4137] [&_.timeline-bullet]:text-white [&_.timeline-vertical-line]:after:bg-[#4D4137]",
      "[&_.timeline-horizontal-line]:bg-[#4D4137]"
    ]
  end

  defp color_class("light") do
    [
      "[&_.timeline-bullet]:bg-[#707483] [&_.timeline-bullet]:text-white [&_.timeline-vertical-line]:after:bg-[#707483]",
      "[&_.timeline-horizontal-line]:bg-[#707483]"
    ]
  end

  defp color_class("dark") do
    [
      "[&_.timeline-bullet]:bg-[#1E1E1E] [&_.timeline-bullet]:text-white [&_.timeline-vertical-line]:after:bg-[#1E1E1E]",
      "[&_.timeline-horizontal-line]:bg-[#1E1E1E]"
    ]
  end

  defp color_class(params) when is_binary(params), do: params

  attr :name, :string, required: true, doc: "Specifies the name of the element"
  attr :class, :any, default: nil, doc: "Custom CSS class for additional styling"

  defp icon(%{name: "hero-" <> _, class: class} = assigns) when is_list(class) do
    ~H"""
    <span class={[@name] ++ @class} />
    """
  end

  defp icon(%{name: "hero-" <> _} = assigns) do
    ~H"""
    <span class={[@name, @class]} />
    """
  end
end
