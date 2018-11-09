defmodule RfcBotWeb.Models.PullRequestReview do
  import RfcBotWeb.Models.PullRequestReviewComment

  @type commit_id :: String.t()
  @type body :: String.t()
  @type event :: String.t()
  @type comments :: list(PullRequestReviewComment)
end
