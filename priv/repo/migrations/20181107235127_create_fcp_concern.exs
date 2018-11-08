defmodule RfcBot.Repo.Migrations.CreateFcpConcern do
  use Ecto.Migration

  def change do
    create table(:fcp_concern) do
      add :proposal_id, references(:fcpproposals, on_delete: :nothing)
      add :initiator_id, references(:githubusers, on_delete: :nothing)
      add :resolved_comment_id, references(:issuecomments, on_delete: :nothing)

      timestamps()
    end

    create index(:fcp_concern, [:proposal_id])
    create index(:fcp_concern, [:initiator_id])
    create index(:fcp_concern, [:resolved_comment_id])
  end
end
