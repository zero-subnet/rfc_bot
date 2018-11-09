defmodule RfcBot.GitHub.Parser do
  @fcp_merge_commands ["merge", "merged", "merging", "merges"]

  @fcp_close_commands ["close", "closed", "closing", "closes"]

  @fcp_postpone_commands ["postpone", "postponed", "postponing", "postones"]

  @fcp_cancel_commands ["cancel", "canceled", "canceling", "cancels"]

  @fcp_review_commands ["reviewed", "review", "reviewing", "reviews"]

  @fcp_concern_commands ["concern", "concerned", "concerning", "concerns"]

  @fcp_resolve_commands ["resolve", "resolved", "resolving", "resolves"]

  @fcp_poll_commands [
    "ask",
    "asked",
    "asking",
    "asks",
    "poll",
    "polled",
    "polling",
    "polls",
    "query",
    "queried",
    "querying",
    "queries",
    "inquire",
    "inquired",
    "inquiring",
    "inquires",
    "quiz",
    "quizzed",
    "quizzing",
    "quizzes",
    "survey",
    "surveyed",
    "surveying",
    "surveys"
  ]

  def parse_command(text) do
    lines = String.split(text, "\n")
  end
end
