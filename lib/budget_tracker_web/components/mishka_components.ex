defmodule BudgetTrackerWeb.Components.MishkaComponents do
  defmacro __using__(_) do
    quote do
      import BudgetTrackerWeb.Components.Accordion, only: [accordion: 1, native_accordion: 1]
      # import BudgetTrackerWeb.Components.Alert, only: [flash: 1, flash_group: 1, alert: 1]
      import BudgetTrackerWeb.Components.Avatar, only: [avatar: 1, avatar_group: 1]
      import BudgetTrackerWeb.Components.Badge, only: [badge: 1]
      import BudgetTrackerWeb.Components.Banner, only: [banner: 1]
      import BudgetTrackerWeb.Components.Blockquote, only: [blockquote: 1]
      import BudgetTrackerWeb.Components.Breadcrumb, only: [breadcrumb: 1]

      import BudgetTrackerWeb.Components.Button,
        only: [button_group: 1, button: 1, input_button: 1, button_link: 1]

      import BudgetTrackerWeb.Components.Card,
        only: [card: 1, card_title: 1, card_media: 1, card_content: 1, card_footer: 1]

      import BudgetTrackerWeb.Components.Carousel, only: [carousel: 1]
      import BudgetTrackerWeb.Components.Chat, only: [chat: 1, chat_section: 1]

      import BudgetTrackerWeb.Components.CheckboxField,
        only: [checkbox_field: 1, group_checkbox: 1]

      import BudgetTrackerWeb.Components.ColorField, only: [color_field: 1]
      import BudgetTrackerWeb.Components.DateTimeField, only: [date_time_field: 1]
      import BudgetTrackerWeb.Components.DeviceMockup, only: [device_mockup: 1]
      import BudgetTrackerWeb.Components.Divider, only: [divider: 1, hr: 1]
      import BudgetTrackerWeb.Components.Drawer, only: [drawer: 1]

      import BudgetTrackerWeb.Components.Dropdown,
        only: [dropdown: 1, dropdown_trigger: 1, dropdown_content: 1]

      import BudgetTrackerWeb.Components.EmailField, only: [email_field: 1]
      import BudgetTrackerWeb.Components.Fieldset, only: [fieldset: 1]
      import BudgetTrackerWeb.Components.FileField, only: [file_field: 1]
      import BudgetTrackerWeb.Components.Footer, only: [footer: 1, footer_section: 1]
      import BudgetTrackerWeb.Components.FormWrapper, only: [form_wrapper: 1]
      import BudgetTrackerWeb.Components.Gallery, only: [gallery: 1, gallery_media: 1]
      import BudgetTrackerWeb.Components.Image, only: [image: 1]
      import BudgetTrackerWeb.Components.Indicator, only: [indicator: 1]
      import BudgetTrackerWeb.Components.InputField, only: [input_field: 1]
      import BudgetTrackerWeb.Components.Jumbotron, only: [jumbotron: 1]
      import BudgetTrackerWeb.Components.Keyboard, only: [keyboard: 1]
      import BudgetTrackerWeb.Components.List, only: [list: 1, li: 1, ul: 1, ol: 1, list_group: 1]
      import BudgetTrackerWeb.Components.MegaMenu, only: [mega_menu: 1]
      import BudgetTrackerWeb.Components.Menu, only: [menu: 1]
      # import BudgetTrackerWeb.Components.Modal, only: [modal: 1]

      import BudgetTrackerWeb.Components.NativeSelect,
        only: [native_select: 1, select_option_group: 1]

      import BudgetTrackerWeb.Components.Navbar, only: [navbar: 1]
      import BudgetTrackerWeb.Components.NumberField, only: [number_field: 1]
      import BudgetTrackerWeb.Components.Overlay, only: [overlay: 1]
      import BudgetTrackerWeb.Components.Pagination, only: [pagination: 1]
      import BudgetTrackerWeb.Components.PasswordField, only: [password_field: 1]

      import BudgetTrackerWeb.Components.Popover,
        only: [popover: 1, popover_trigger: 1, popover_content: 1]

      import BudgetTrackerWeb.Components.Progress, only: [progress: 1, progress_section: 1]
      import BudgetTrackerWeb.Components.RadioField, only: [radio_field: 1]
      import BudgetTrackerWeb.Components.RangeField, only: [range_field: 1]
      import BudgetTrackerWeb.Components.Rating, only: [rating: 1]
      import BudgetTrackerWeb.Components.SearchField, only: [search_field: 1]
      import BudgetTrackerWeb.Components.Sidebar, only: [sidebar: 1]
      import BudgetTrackerWeb.Components.Skeleton, only: [skeleton: 1]
      import BudgetTrackerWeb.Components.SpeedDial, only: [speed_dial: 1]
      import BudgetTrackerWeb.Components.Spinner, only: [spinner: 1]
      import BudgetTrackerWeb.Components.Stepper, only: [stepper: 1, stepper_section: 1]
      import BudgetTrackerWeb.Components.Table, only: [table: 1, th: 1, tr: 1, td: 1]

      import BudgetTrackerWeb.Components.TableContent,
        only: [table_content: 1, content_wrapper: 1, content_item: 1]

      import BudgetTrackerWeb.Components.Tabs, only: [tabs: 1]
      import BudgetTrackerWeb.Components.TelField, only: [tel_field: 1]
      import BudgetTrackerWeb.Components.TextField, only: [text_field: 1]
      import BudgetTrackerWeb.Components.TextareaField, only: [textarea_field: 1]
      import BudgetTrackerWeb.Components.Timeline, only: [timeline: 1, timeline_section: 1]
      import BudgetTrackerWeb.Components.Toast, only: [toast: 1, toast_group: 1]
      import BudgetTrackerWeb.Components.ToggleField, only: [toggle_field: 1]
      import BudgetTrackerWeb.Components.Tooltip, only: [tooltip: 1]

      import BudgetTrackerWeb.Components.Typography,
        only: [
          h1: 1,
          h2: 1,
          h3: 1,
          h4: 1,
          h5: 1,
          h6: 1,
          p: 1,
          strong: 1,
          em: 1,
          dl: 1,
          dt: 1,
          dd: 1,
          figure: 1,
          figcaption: 1,
          abbr: 1,
          mark: 1,
          small: 1,
          s: 1,
          u: 1,
          cite: 1,
          del: 1
        ]

      import BudgetTrackerWeb.Components.UrlField, only: [url_field: 1]
      import BudgetTrackerWeb.Components.Video, only: [video: 1]
    end
  end
end
