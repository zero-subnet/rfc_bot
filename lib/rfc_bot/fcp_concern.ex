defmodule RfcBot.FcpConcern do
  use Ecto.Schema
  import Ecto.Changeset

  schema "fcp_concern" do
    field(:proposal_id, :id)
    field(:initiator_id, :id)
    field(:resolved_comment_id, :id)

    timestamps()
  end

  @doc false
  def changeset(fcp_concern, attrs) do
    fcp_concern
    |> cast(attrs, [])
    |> validate_required([])
  end
end
