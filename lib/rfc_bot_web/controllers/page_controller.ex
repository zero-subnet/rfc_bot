
defmodule RfcBotWeb.PageController do
  use RfcBotWeb, :controller

  def github_payload(conn, params) do
    inspect(params)
    conn 
    |> put_status(200)
    |> text("")
  end

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def handle_pr(conn, _params) do
    
  end

  def handle_comment(conn, _params) do
    
  end

  def handle_issue(conn, _params) do
    
  end

  def handle_user(conn, _params) do
    
  end

  def handle_ping(conn, _params) do
    
  end
end
