defmodule RfcBot.Repo.Migrations.CreateIssuecomments do
  use Ecto.Migration

  def change do
    create table(:issuecomments) do
      add :created_at, :naive_datetime
      add :repository, :naive_datetime
      add :issue_id, references(:issues, on_delete: :nothing)
      add :user_id, references(:githubusers, on_delete: :nothing)

      timestamps()
    end

    create index(:issuecomments, [:issue_id])
    create index(:issuecomments, [:user_id])
  end
end
