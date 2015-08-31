defmodule Codetalks.Router do
  use Codetalks.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :assign_current_user
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Codetalks do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/hello", HelloController, :index
    get "/hello/:messenger", HelloController, :show

    resources "/users", UserController
    resources "/talks", TalkController
  end

  scope "/auth", alias: Codetalks do
    pipe_through :browser
    get "/", AuthController, :index
    get "/callback", AuthController, :callback
  end

  # Other scopes may use custom stacks.
  # scope "/api", Codetalks do
  #   pipe_through :api
  # end

  defp assign_current_user(conn, _) do
    assign(conn, :current_user, get_session(conn, :current_user))
  end
end
