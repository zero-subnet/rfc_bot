defmodule RfcBot.Repo.Migrations.CreatePullrequests do
  use Ecto.Migration

  def change do
    create table(:pullrequests) do
      add(:number, :integer)
      add(:state, :string)
      add(:title, :string)
      add(:body, :string)
      add(:locked, :boolean, default: false, null: false)
      add(:created_at, :naive_datetime)
      add(:closed_at, :naive_datetime)
      add(:merged_at, :naive_datetime)
      add(:commits, :integer)
      add(:additions, :integer)
      add(:deletions, :integer)
      add(:changed_files, :integer)
      add(:repository, :string)
      add(:assignee_id, references(:githubusers, on_delete: :nothing))
      add(:milestone_id, references(:milestones, on_delete: :nothing))

      timestamps()
    end

    create(index(:pullrequests, [:assignee_id]))
    create(index(:pullrequests, [:milestone_id]))
  end
end
