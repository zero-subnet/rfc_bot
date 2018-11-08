defmodule RfcBot.PollResponseRequest do
  use Ecto.Schema
  import Ecto.Changeset

  schema "poll_response_request" do
    field(:responded, :boolean, default: false)
    field(:poll_id, :id)
    field(:respondent_id, :id)

    timestamps()
  end

  @doc false
  def changeset(poll_response_request, attrs) do
    poll_response_request
    |> cast(attrs, [:responded])
    |> validate_required([:responded])
  end
end
