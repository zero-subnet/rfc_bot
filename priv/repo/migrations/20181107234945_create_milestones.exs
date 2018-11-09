defmodule RfcBot.Repo.Migrations.CreateMilestones do
  use Ecto.Migration

  def change do
    create table(:milestones) do
      add(:number, :integer)
      add(:open, :boolean, default: false, null: false)
      add(:title, :string)
      add(:description, :string)
      add(:open_issues, :integer)
      add(:closed_issues, :integer)
      add(:created_at, :naive_datetime)
      add(:closed_at, :naive_datetime)
      add(:due_on, :naive_datetime)
      add(:repository, :string)
      add(:creator_id, references(:githubusers, on_delete: :nothing))

      timestamps()
    end

    create(index(:milestones, [:creator_id]))
  end
end
