defmodule RfcBot.GitHub.Client do
  @moduledoc """
  Client for interacting with GitHub API
  """
  import Ecto.Query
  import Tentacat

  @doc """
  Retrieves all the repositories for an organization
  """
  def org_repos(org) do
    {200, data, _response} = get_github_client()
    |> Tentacat.Repositories.list_orgs(org)
    Enum.map(data, fn (repo) -> repo["name"] end)
  end

  @doc """
  Retrieves all issues since a certain date supplied in GMT
  """
  def issues_since(owner, repo, start) do
    {200, data, _response} = get_github_client()
    |> Tentacat.Issues.filter(owner, repo, %{created: ">=#{start}" })
  end

  @doc """
  Retrieves all comments on a repo since a date supplied in GMT
  """
  def comments_since(owner, repo, since_date) do
    comments = get_github_client()
    |> Tentacat.Issues.Comments.filter_all(owner, repo, since: "#{since_date}")
  end

  @doc """
  Closes an issue
  """
  def close_issue(owner, repo, issue_number) do
    result = get_github_client()
    |> Tentacat.Issues.update(owner, repo, issue_number, %{"state" => "closed"})
  end

  @doc """
  Adds a label to an issue
  """
  def add_label(owner, repo, issue_number, label) do
    result = get_github_client()
    |> Tentacat.Issues.Labels.add(owner, repo, issue_number, label)
  end

  @doc """
  Removes a label from an issue
  """
  def remove_label(owner, repo, issue_number, label) do
    result = get_github_client()
    |> Tentacat.Issues.Labels.remove(owner, repo, issue_number, label)
  end

  @doc """
  Adds a comment to an issue
  """
  def new_comment(owner, repo, issue_number, body_text) do
    get_github_client()
    |> Tentacat.Issues.Comments.create(owner, repo, issue_number, body_text)
  end

  @doc """
  Edits an existing comment on an issue
  """
  def edit_comment(owner, repo, comment_number, body_text) do
    get_github_client()
    |> Tentacat.Issues.Comments.update(owner, repo, comment_number, body_text)
  end

  @doc """
  Gets the most recent sync time of a GitHub repo
  """
  def most_recent_sync(org, repo) do
    Repo.one(from x in RfcBot.GitHubSync, order_by: [desc: x.ran_at], limit: 1)
  end
  
  @doc """
  Records a successful sync
  """
  def record_successful_sync(org, repo, successful) do
    params = %{:successful => successful, :repo => repo, :ran_at => DateTime.utc_now()}
    changeset = RfcBot.GitHubSync.changeset(%RfcBot.GitHubSync{},  params)
  end

  defp get_github_client() do
    key = Application.get_env(:rfc_bot, :key)
    Tentacat.Client.new(%{access_token: key})
  end
end
