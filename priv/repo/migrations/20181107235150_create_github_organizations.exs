defmodule RfcBot.Repo.Migrations.CreateGithubOrganizations do
  use Ecto.Migration

  def change do
    create table(:github_organizations) do
      add(:name, :string)
      add(:org_id, :integer)
      add(:description, :string)

      timestamps()
    end
  end
end
