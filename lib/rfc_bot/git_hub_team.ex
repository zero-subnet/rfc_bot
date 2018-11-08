defmodule RfcBot.GitHubTeam do
  use Ecto.Schema
  import Ecto.Changeset

  schema "github_teams" do
    field(:github_organization_id, :id)

    timestamps()
  end

  @doc false
  def changeset(git_hub_team, attrs) do
    git_hub_team
    |> cast(attrs, [])
    |> validate_required([])
  end
end
