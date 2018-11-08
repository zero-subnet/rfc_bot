defmodule RfcBot.PullRequest do
  use Ecto.Schema
  import Ecto.Changeset

  schema "pullrequests" do
    field(:additions, :integer)
    field(:body, :string)
    field(:changed_files, :integer)
    field(:closed_at, :naive_datetime)
    field(:commits, :integer)
    field(:created_at, :naive_datetime)
    field(:deletions, :integer)
    field(:locked, :boolean, default: false)
    field(:merged_at, :naive_datetime)
    field(:number, :integer)
    field(:repository, :string)
    field(:state, :string)
    field(:title, :string)
    field(:assignee_id, :id)
    field(:milestone_id, :id)

    timestamps()
  end

  @doc false
  def changeset(pull_request, attrs) do
    pull_request
    |> cast(attrs, [
      :number,
      :state,
      :title,
      :body,
      :locked,
      :created_at,
      :updated_at,
      :closed_at,
      :merged_at,
      :commits,
      :additions,
      :deletions,
      :changed_files,
      :repository
    ])
    |> validate_required([
      :number,
      :state,
      :title,
      :body,
      :locked,
      :created_at,
      :updated_at,
      :closed_at,
      :merged_at,
      :commits,
      :additions,
      :deletions,
      :changed_files,
      :repository
    ])
  end
end
