defmodule PhxLv2Web.Endpoint do
  use Phoenix.Endpoint, otp_app: :phx_lv_2

  @session_options [
    store: :cookie,
    key: "_phx_lv_1_key",
    signing_salt: "uWiv8qk3"
  ]

  socket "/socket", PhxLv2Web.UserSocket,
    websocket: true,
    longpoll: false

    socket "/live", Phoenix.LiveView.Socket,
    websocket: [connect_info: [session: @session_options]]

  plug Plug.Static,
    at: "/",
    from: :phx_lv_2,
    gzip: false,
    only: ~w(css fonts images js favicon.ico robots.txt)

  if code_reloading? do
    socket "/phoenix/live_reload/socket", Phoenix.LiveReloader.Socket
    plug Phoenix.LiveReloader
    plug Phoenix.CodeReloader
  end

  plug Plug.RequestId
  plug Plug.Telemetry, event_prefix: [:phoenix, :endpoint]

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()

  plug Plug.MethodOverride
  plug Plug.Head
  plug Plug.Session, @session_options
  plug PhxLv2Web.Router
end
