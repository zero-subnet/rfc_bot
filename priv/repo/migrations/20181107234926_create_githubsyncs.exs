defmodule RfcBot.Repo.Migrations.CreateGithubsyncs do
  use Ecto.Migration

  def change do
    create table(:githubsyncs) do
      add(:successful, :boolean, default: false, null: false)
      add(:ran_at, :naive_datetime)
      add(:message, :string)

      timestamps()
    end
  end
end
