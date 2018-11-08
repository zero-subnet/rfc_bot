defmodule RfcBot.Repo.Migrations.CreateGithubTeams do
  use Ecto.Migration

  def change do
    create table(:github_teams) do
      add :github_organization_id, references(:github_organizations, on_delete: :nothing)

      timestamps()
    end

    create index(:github_teams, [:github_organization_id])
  end
end
