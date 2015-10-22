defmodule Codetalks.Plugs.CheckAuthentication do
  @moduledoc """
  A plug that checks the connection for a present session,
  and assigns a current_user to the conn.
  """

  import Plug.Conn
  import Plug.Session

  def init(options) do
    options
  end

  @doc """
  Assign the current_user, if appropriate.
  """
  def call(conn, _) do
    user_id = get_session(conn, :user_id)
    if session_present?(user_id) do
      assign(conn, :current_user, Codetalks.Repo.get(Codetalks.User, user_id))
    else
      conn
    end
  end

  defp session_present?(user_id) do
    case user_id do
      nil -> false
      _   -> true
    end
  end
end
