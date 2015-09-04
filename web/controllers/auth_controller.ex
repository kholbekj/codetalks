defmodule Codetalks.AuthController do
  use Codetalks.Web, :controller

  plug :action

  @doc """
  This action is reached via `/auth` and redirects to the OAuth2 provider
  based on the chosen strategy.
  """
  def index(conn, _params) do
    redirect conn, external: GitHub.authorize_url!
  end

  @doc """
  This action is reached via `/auth/callback` is the the callback URL that
  the OAuth2 provider will redirect the user back to with a `code` that will
  be used to request an access token. The access token will then be used to
  access protected resources on behalf of the user.
  """
  def callback(conn, %{"code" => code}) do
    # Exchange an auth code for an access token
    token = GitHub.get_token!(code: code)

    # Request the user's data with the access token
    github_user = OAuth2.AccessToken.get!(token, "/user")

    # Store the user in the session under `:current_user` and redirect to /.
    # In most cases, we'd probably just store the user's ID that can be used
    # to fetch from the database. In this case, since this example app has no
    # database, I'm just storing the user map.
    #
    # If you need to make additional resource requests, you may want to store
    # the access token as well.
    alias Codetalks.User
    alias Codetalks.Repo
    user = List.first Repo.all from u in User, where: u.github_id == ^github_user["id"]
    if is_nil(user) do
      changeset = User.changeset(%User{}, %{email: github_user["email"], name: github_user["name"]})
      case Repo.insert(changeset) do
        {:ok, new_user} ->
          user = new_user
        {:error, changeset} ->
          IO.puts("Something went wrong!")
          raise changeset
      end
    end

    conn
    |> put_session(:user_id, user.id)
    |> put_session(:access_token, token.access_token)
    |> redirect(to: "/")
  end
end
