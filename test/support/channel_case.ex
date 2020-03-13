defmodule PhxLv2Web.ChannelCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      use Phoenix.ChannelTest

      @endpoint PhxLv2Web.Endpoint
    end
  end

  setup _tags do
    :ok
  end
end
