defmodule PhxLv2Web.TestLive do
    use Phoenix.LiveView

  def render(assigns) do
    Phoenix.View.render(PhxLv2Web.TestView, "test.html", assigns)
  end

  def mount(_params, _session, socket) do
    if connected?(socket) do
      Process.send_after(self(), :update, 1000)
    end
    {:ok, assign(socket, x: 0, values: nil)}
  end

  def handle_event("update", _value, socket) do
    IO.puts "update"
    values = (1..100) |> Enum.map(fn i -> [i, :rand.uniform(100)] end)
    {:noreply, assign(socket, :values, values)}
  end

  def handle_event(what, value, socket) do
    IO.puts "handle_event. what = #{inspect(what)}, value = #{inspect(value)}"
    {:noreply, socket}
  end

  def handle_info(:update, %{assigns: %{x: x}} = socket) do
    Process.send_after(self(), :update, 1000)
    {:noreply, assign(socket, :x, x+1)}
  end

  def handle_info(what, socket) do
    IO.puts "handle_info. what = #{inspect(what)}"
    # IO.inspect what
    # IO.inspect socket, limit: :infinity
    {:noreply, socket}
  end
end
