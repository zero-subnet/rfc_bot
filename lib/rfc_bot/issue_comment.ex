defmodule RfcBot.IssueComment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "issuecomments" do
    field(:created_at, :naive_datetime)
    field(:repository, :naive_datetime)
    field(:issue_id, :id)
    field(:user_id, :id)

    timestamps()
  end

  @doc false
  def changeset(issue_comment, attrs) do
    issue_comment
    |> cast(attrs, [:created_at, :updated_at, :repository])
    |> validate_required([:created_at, :updated_at, :repository])
  end
end
