defmodule PhxLv2Web do
  def controller do
    quote do
      use Phoenix.Controller, namespace: PhxLv2Web

      import Plug.Conn
      import PhxLv2Web.Gettext
      alias PhxLv2Web.Router.Helpers, as: Routes
      import Phoenix.LiveView.Controller
    end
  end

  def view do
    quote do
      use Phoenix.View,
        root: "lib/phx_lv_2_web/templates",
        namespace: PhxLv2Web

      import Phoenix.Controller, only: [get_flash: 1, get_flash: 2, view_module: 1]

      use Phoenix.HTML

      import PhxLv2Web.ErrorHelpers
      import PhxLv2Web.Gettext
      alias PhxLv2Web.Router.Helpers, as: Routes
      import Phoenix.LiveView.Helpers
    end
  end

  def router do
    quote do
      use Phoenix.Router
      import Plug.Conn
      import Phoenix.Controller
      import Phoenix.LiveView.Router
    end
  end

  def channel do
    quote do
      use Phoenix.Channel
      import PhxLv2Web.Gettext
    end
  end

  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
