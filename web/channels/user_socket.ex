defmodule TwitterDevMood.UserSocket do
  use Phoenix.Socket

  channel "stats:*", TwitterDevMood.StatsChannel

  transport :websocket, Phoenix.Transports.WebSocket, check_origin: false

  def connect(_params, socket) do
    {:ok, socket}
  end

  def id(_socket), do: nil
end
