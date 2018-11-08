defmodule RfcBot.Repo.Migrations.CreateIssues do
  use Ecto.Migration

  def change do
    create table(:issues) do
      add :number, :integer
      add :open, :boolean, default: false, null: false
      add :is_pull_request, :boolean, default: false, null: false
      add :title, :string
      add :body, :string
      add :locked, :boolean, default: false, null: false
      add :closed_at, :naive_datetime
      add :created_at, :naive_datetime
      add :labels, {:array, :string}
      add :repository, :string
      add :milestone_id, references(:milestones, on_delete: :nothing)
      add :user_id, references(:githubusers, on_delete: :nothing)
      add :assignee_id, references(:githubusers, on_delete: :nothing)

      timestamps()
    end

    create index(:issues, [:milestone_id])
    create index(:issues, [:user_id])
    create index(:issues, [:assignee_id])
  end
end
