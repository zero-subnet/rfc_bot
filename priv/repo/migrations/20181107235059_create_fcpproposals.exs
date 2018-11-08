defmodule RfcBot.Repo.Migrations.CreateFcpproposals do
  use Ecto.Migration

  def change do
    create table(:fcpproposals) do
      add :disposition, :boolean, default: false, null: false
      add :fcp_start, :naive_datetime
      add :fcp_closed, :boolean, default: false, null: false
      add :issue_id, references(:issues, on_delete: :nothing)
      add :initiator_id, references(:githubusers, on_delete: :nothing)
      add :initiating_comment_id, references(:issuecomments, on_delete: :nothing)
      add :bot_tracking_comment_id, references(:issuecomments, on_delete: :nothing)

      timestamps()
    end

    create index(:fcpproposals, [:issue_id])
    create index(:fcpproposals, [:initiator_id])
    create index(:fcpproposals, [:initiating_comment_id])
    create index(:fcpproposals, [:bot_tracking_comment_id])
  end
end
