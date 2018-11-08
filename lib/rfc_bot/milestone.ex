defmodule RfcBot.Milestone do
  use Ecto.Schema
  import Ecto.Changeset

  schema "milestones" do
    field(:closed_at, :naive_datetime)
    field(:closed_issues, :integer)
    field(:created_at, :naive_datetime)
    field(:description, :string)
    field(:due_on, :naive_datetime)
    field(:number, :integer)
    field(:open, :boolean, default: false)
    field(:open_issues, :integer)
    field(:repository, :string)
    field(:title, :string)
    field(:creator_id, :id)

    timestamps()
  end

  @doc false
  def changeset(milestone, attrs) do
    milestone
    |> cast(attrs, [
      :number,
      :open,
      :title,
      :description,
      :open_issues,
      :closed_issues,
      :created_at,
      :updated_at,
      :closed_at,
      :due_on,
      :repository
    ])
    |> validate_required([
      :number,
      :open,
      :title,
      :description,
      :open_issues,
      :closed_issues,
      :created_at,
      :updated_at,
      :closed_at,
      :due_on,
      :repository
    ])
  end
end
