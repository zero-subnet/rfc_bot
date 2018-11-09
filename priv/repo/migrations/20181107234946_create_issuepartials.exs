defmodule RfcBot.Repo.Migrations.CreateIssuepartials do
  use Ecto.Migration

  def change do
    create table(:issuepartials) do
      add(:open, :boolean, default: false, null: false)
      add(:is_pull_request, :boolean, default: false, null: false)
      add(:title, :string)
      add(:body, :string)
      add(:locked, :boolean, default: false, null: false)
      add(:closed_at, :naive_datetime)
      add(:created_at, :naive_datetime)
      add(:labels, {:array, :string})
      add(:repository, :string)
      add(:milestone_id, references(:milestones, on_delete: :nothing))
      add(:githubuser_id, references(:githubusers, on_delete: :nothing))
      add(:assignee_id, references(:githubusers, on_delete: :nothing))

      timestamps()
    end

    create(index(:issuepartials, [:milestone_id]))
    create(index(:issuepartials, [:githubuser_id]))
    create(index(:issuepartials, [:assignee_id]))
  end
end
