defmodule RfcBot.GitHubOrganization do
  use Ecto.Schema
  import Ecto.Changeset

  schema "github_organizations" do
    field(:description, :string)
    field(:name, :string)
    field(:org_id, :integer)

    timestamps()
  end

  @doc false
  def changeset(git_hub_organization, attrs) do
    git_hub_organization
    |> cast(attrs, [:name, :org_id, :description])
    |> validate_required([:name, :org_id, :description])
  end
end
