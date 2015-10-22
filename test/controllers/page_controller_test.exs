defmodule Codetalks.PageControllerTest do
  use Codetalks.ConnCase

  test "GET /" do
    conn = get conn(), "/"
    assert html_response(conn, 200) =~ "Welcome to the Codetalk Cafe!"
  end
end
