defmodule RfcBotWeb.Models.PullRequest do
  @type title() :: String.t()
  @type head() :: String.t()
  @type base() :: String.t()
  @type body() :: String.t()
  @type maintain_can_modify() :: boolean()
end
