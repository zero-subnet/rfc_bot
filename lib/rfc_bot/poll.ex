defmodule RfcBot.Poll do
  use Ecto.Schema
  import Ecto.Changeset

  schema "polls" do
    field(:poll_closed, :boolean, default: false)
    field(:poll_created_at, :naive_datetime)
    field(:poll_question, :string)
    field(:poll_teams, :string)
    field(:issue_id, :id)
    field(:initiator, :id)
    field(:initiating_comment_id, :id)
    field(:bot_tracking_comment_id, :id)

    timestamps()
  end

  @doc false
  def changeset(poll, attrs) do
    poll
    |> cast(attrs, [:poll_question, :poll_created_at, :poll_closed, :poll_teams])
    |> validate_required([:poll_question, :poll_created_at, :poll_closed, :poll_teams])
  end
end
