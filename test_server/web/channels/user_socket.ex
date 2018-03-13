defmodule TestServer.UserSocket do
  use Phoenix.Socket

  channel "*", TestServer.UserChannel
  transport :websocket, Phoenix.Transports.WebSocket,
    timeout: 1_000

  def connect(params, socket) do
    if params["authenticated"] === "true" do
      {:ok, socket}
    else
      :error
    end
  end

  def id(_socket), do: nil
end
