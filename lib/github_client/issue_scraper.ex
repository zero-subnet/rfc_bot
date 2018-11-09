defmodule RfcBot.GitHub.IssueScraper do
  use GenServer
  import RfcBot.GitHub.Client

  @doc """
  GenServer.init/1 callback
  """
  def start_link(state \\ []) do
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  def init(state) do
    {:ok, state}
  end

  def handle_info(message, state) do
    {:noreply, state}
  end

  def handle_cast({:scrape, target}, state) do
    Client.issues_since(target["org"], target["repo"], target["date"])
    {:noreply, state}
  end

end