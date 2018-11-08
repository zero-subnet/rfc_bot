defmodule RfcBot.Repo.Migrations.CreateFcpReviewRequest do
  use Ecto.Migration

  def change do
    create table(:fcp_review_request) do
      add :reviewed, :boolean, default: false, null: false
      add :proposal_id, references(:fcpproposals, on_delete: :nothing)
      add :reviewer_id, references(:githubusers, on_delete: :nothing)

      timestamps()
    end

    create index(:fcp_review_request, [:proposal_id])
    create index(:fcp_review_request, [:reviewer_id])
  end
end
