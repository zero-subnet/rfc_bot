defmodule RfcBot.GitHub.Client do
  @moduledoc """
  Client for interacting with GitHub API
  """

  import Tentacat

  def me do
    get_github_client
    |> Tentacat.Users.me()
  end

  defp get_github_client() do
    key = Application.get_env(:GitHubClient, :key)
    Tentacat.Client.new(%{access_token: key})
  end
end
