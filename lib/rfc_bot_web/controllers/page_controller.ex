defmodule RfcBotWeb.PageController do
  use RfcBotWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
