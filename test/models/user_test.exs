defmodule Codetalks.UserTest do
  use Codetalks.ModelCase

  alias Codetalks.User

  @valid_attrs %{github_id: 123, name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
