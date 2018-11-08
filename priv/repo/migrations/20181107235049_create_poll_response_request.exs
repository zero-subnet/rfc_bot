defmodule RfcBot.Repo.Migrations.CreatePollResponseRequest do
  use Ecto.Migration

  def change do
    create table(:poll_response_request) do
      add :responded, :boolean, default: false, null: false
      add :poll_id, references(:polls, on_delete: :nothing)
      add :respondent_id, references(:githubusers, on_delete: :nothing)

      timestamps()
    end

    create index(:poll_response_request, [:poll_id])
    create index(:poll_response_request, [:respondent_id])
  end
end
