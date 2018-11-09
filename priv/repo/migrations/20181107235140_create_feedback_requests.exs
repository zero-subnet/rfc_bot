defmodule RfcBot.Repo.Migrations.CreateFeedbackRequests do
  use Ecto.Migration

  def change do
    create table(:feedback_requests) do
      add(:initiator_id, references(:githubusers, on_delete: :nothing))
      add(:requested_id, references(:githubusers, on_delete: :nothing))
      add(:issue_id, references(:issues, on_delete: :nothing))
      add(:feedback_comment_id, references(:issuecomments, on_delete: :nothing))

      timestamps()
    end

    create(index(:feedback_requests, [:initiator_id]))
    create(index(:feedback_requests, [:requested_id]))
    create(index(:feedback_requests, [:issue_id]))
    create(index(:feedback_requests, [:feedback_comment_id]))
  end
end
