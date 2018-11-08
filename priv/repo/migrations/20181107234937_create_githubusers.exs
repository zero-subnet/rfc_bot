defmodule RfcBot.Repo.Migrations.CreateGithubusers do
  use Ecto.Migration

  def change do
    create table(:githubusers) do
      add :login, :string

      timestamps()
    end

  end
end
