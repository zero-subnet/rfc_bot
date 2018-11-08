defmodule RfcBot.GitHub.Client do
  @moduledoc """
  Client for interacting with GitHub API
  """

  import Tentacat

  def me do
    get_github_client
    |> Tentacat.Users.me()
  end

  @doc """
  Retrieves all the repositories for an organization
  """
  def org_repos(org) do
    {200, data, _response} = get_github_client
    |> Tentacat.Repositories.list_orgs(org)
    Enum.map(data, fn (repo) -> repo["name"] end)
  end

  @doc """
  Retrieves all issues since a certain date supplied in GMT
  """
  def issues_since(owner, repo, start) do
    IO.puts(inspect(">#{start}"))
    {200, data, _response} = get_github_client
    |> Tentacat.Issues.filter(owner, repo, %{created: ">=#{start}" })
  end

  @doc """
  Retrieves all comments on a repo since a date supplied in GMT
  """
  def comments_since(repo, start) do
  end

  @doc """
  Closes an issue
  """
  def close_issue(repo, issue_number) do
  end

  @doc """
  Adds a label to an issue
  """
  def add_label(repo, issue_number, label) do
  end

  @doc """
  Removes a label from an issue
  """
  def remove_label(repo, issue_number, label) do
  end

  @doc """
  Adds a comment to an issue
  """
  def new_comment(repo, issue_number, text) do
  end

  @doc """
  Edits an existing comment on an issue
  """
  def edit_comment(repo, comment_number, text) do
  end

  defp get_github_client() do
    key = Application.get_env(:rfc_bot, :key)
    Tentacat.Client.new(%{access_token: key})
  end
end
