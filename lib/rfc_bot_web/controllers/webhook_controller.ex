defmodule RfcBotWeb.WebHookController do
  import Logger
  use RfcBotWeb, :controller

  @supported_events ["ping"]

  @doc """
  Extracts what type of event is being sent
  """
  def process_event(conn, params) do
    event_type = get_req_header(conn, "x-github-event")
    case event_type do
      "ping" -> handle_ping(conn, params)
      "issues" -> handle_issues(conn, params)
      "pull_request" -> handle_pull_request(conn, params)
      "issue_comment" -> handle_issue_comment(conn, params)
      _ -> handle_unknown(conn, params)
    end
  end

  defp handle_ping(conn, params) do
    conn
    |> put_status(200)
    |> text("")
  end

  defp handle_issues(conn, params) do
  
  end

  defp handle_pull_request(conn, params) do
    
  end

  defp handle_issue_comment(conn, params) do
  
  end


  defp handle_unknown(conn, params) do
    event_type = get_req_header(conn, "x-github-event")
    Logger.error("Unknown event seen: #{event_type}")
    conn
    |> put_status(200)
    |> text("")
  end
end