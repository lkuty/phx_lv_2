defmodule PhxLv2Web.PageController do
  use PhxLv2Web, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
  def test(conn, _) do
    live_render(conn, PhxLv2Web.TestLive)
  end
end
