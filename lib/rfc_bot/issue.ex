defmodule RfcBot.Issue do
  use Ecto.Schema
  import Ecto.Changeset

  schema "issues" do
    field(:body, :string)
    field(:closed_at, :naive_datetime)
    field(:created_at, :naive_datetime)
    field(:is_pull_request, :boolean, default: false)
    field(:labels, {:array, :string})
    field(:locked, :boolean, default: false)
    field(:number, :integer)
    field(:open, :boolean, default: false)
    field(:repository, :string)
    field(:title, :string)
    field(:milestone_id, :id)
    field(:user_id, :id)
    field(:assignee_id, :id)

    timestamps()
  end

  @doc false
  def changeset(issue, attrs) do
    issue
    |> cast(attrs, [
      :number,
      :open,
      :is_pull_request,
      :title,
      :body,
      :locked,
      :closed_at,
      :created_at,
      :updated_at,
      :labels,
      :repository
    ])
    |> validate_required([
      :number,
      :open,
      :is_pull_request,
      :title,
      :body,
      :locked,
      :closed_at,
      :created_at,
      :updated_at,
      :labels,
      :repository
    ])
  end
end
