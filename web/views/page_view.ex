defmodule Codetalks.PageView do
  use Codetalks.Web, :view

  def current_user(conn) do
    conn.assigns[:current_user]
  end
end
