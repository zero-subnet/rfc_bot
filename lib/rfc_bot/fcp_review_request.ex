defmodule RfcBot.FcpReviewRequest do
  use Ecto.Schema
  import Ecto.Changeset

  schema "fcp_review_request" do
    field(:reviewed, :boolean, default: false)
    field(:proposal_id, :id)
    field(:reviewer_id, :id)

    timestamps()
  end

  @doc false
  def changeset(fcp_review_request, attrs) do
    fcp_review_request
    |> cast(attrs, [:reviewed])
    |> validate_required([:reviewed])
  end
end
