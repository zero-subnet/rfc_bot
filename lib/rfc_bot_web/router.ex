defmodule RfcBotWeb.Router do
  use RfcBotWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  # Other scopes may use custom stacks.
  scope "/api", RfcBotWeb do
    pipe_through :api

    post("/github/payload", WebHookController, :process_event)
  end
end
