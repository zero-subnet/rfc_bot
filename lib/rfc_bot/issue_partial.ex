defmodule RfcBot.IssuePartial do
  use Ecto.Schema
  import Ecto.Changeset

  schema "issuepartials" do
    field(:body, :string)
    field(:closed_at, :naive_datetime)
    field(:created_at, :naive_datetime)
    field(:is_pull_request, :boolean, default: false)
    field(:labels, {:array, :string})
    field(:locked, :boolean, default: false)
    field(:open, :boolean, default: false)
    field(:repository, :string)
    field(:title, :string)
    field(:milestone_id, :id)
    field(:githubuser_id, :id)
    field(:assignee_id, :id)

    timestamps()
  end

  @doc false
  def changeset(issue_partial, attrs) do
    issue_partial
    |> cast(attrs, [
      :open,
      :is_pull_request,
      :title,
      :body,
      :locked,
      :closed_at,
      :created_at,
      :labels,
      :repository
    ])
    |> validate_required([
      :open,
      :is_pull_request,
      :title,
      :body,
      :locked,
      :closed_at,
      :created_at,
      :labels,
      :repository
    ])
  end
end
