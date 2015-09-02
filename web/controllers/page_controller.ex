defmodule Codetalks.PageController do
  use Codetalks.Web, :controller
  plug Codetalks.Plugs.CheckAuthentication

  def index(conn, _params) do
    render conn, "index.html"
  end
end
