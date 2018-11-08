defmodule RfcBot.FcpProposal do
  use Ecto.Schema
  import Ecto.Changeset

  schema "fcpproposals" do
    field(:disposition, :boolean, default: false)
    field(:fcp_closed, :boolean, default: false)
    field(:fcp_start, :naive_datetime)
    field(:issue_id, :id)
    field(:initiator_id, :id)
    field(:initiating_comment_id, :id)
    field(:bot_tracking_comment_id, :id)

    timestamps()
  end

  @doc false
  def changeset(fcp_proposal, attrs) do
    fcp_proposal
    |> cast(attrs, [:disposition, :fcp_start, :fcp_closed])
    |> validate_required([:disposition, :fcp_start, :fcp_closed])
  end
end
