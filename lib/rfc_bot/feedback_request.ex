defmodule RfcBot.FeedbackRequest do
  use Ecto.Schema
  import Ecto.Changeset

  schema "feedback_requests" do
    field(:initiator_id, :id)
    field(:requested, :id)
    field(:issue_id, :id)
    field(:feedback_comment, :id)

    timestamps()
  end

  @doc false
  def changeset(feedback_request, attrs) do
    feedback_request
    |> cast(attrs, [])
    |> validate_required([])
  end
end
