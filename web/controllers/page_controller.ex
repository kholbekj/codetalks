defmodule Codetalks.PageController do
  use Codetalks.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
