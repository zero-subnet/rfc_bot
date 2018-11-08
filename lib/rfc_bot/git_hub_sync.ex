defmodule RfcBot.GitHubSync do
  use Ecto.Schema
  import Ecto.Changeset

  schema "githubsyncs" do
    field(:message, :string)
    field(:ran_at, :naive_datetime)
    field(:successful, :boolean, default: false)

    timestamps()
  end

  @doc false
  def changeset(git_hub_sync, attrs) do
    git_hub_sync
    |> cast(attrs, [:successful, :ran_at, :message])
    |> validate_required([:successful, :ran_at, :message])
  end
end
