defmodule RfcBot.Repo.Migrations.CreatePolls do
  use Ecto.Migration

  def change do
    create table(:polls) do
      add(:poll_question, :string)
      add(:poll_created_at, :naive_datetime)
      add(:poll_closed, :boolean, default: false, null: false)
      add(:poll_teams, :string)
      add(:issue_id, references(:issues, on_delete: :nothing))
      add(:initiator_id, references(:githubusers, on_delete: :nothing))
      add(:initiating_comment_id, references(:issuecomments, on_delete: :nothing))
      add(:bot_tracking_comment_id, references(:issuecomments, on_delete: :nothing))

      timestamps()
    end

    create(index(:polls, [:issue_id]))
    create(index(:polls, [:initiator_id]))
    create(index(:polls, [:initiating_comment_id]))
    create(index(:polls, [:bot_tracking_comment_id]))
  end
end
