defmodule RfcBot.GitHubUser do
  use Ecto.Schema
  import Ecto.Changeset

  schema "githubusers" do
    field(:login, :string)

    timestamps()
  end

  @doc false
  def changeset(git_hub_user, attrs) do
    git_hub_user
    |> cast(attrs, [:login])
    |> validate_required([:login])
  end
end
