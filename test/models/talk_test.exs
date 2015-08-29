defmodule Codetalks.TalkTest do
  use Codetalks.ModelCase

  alias Codetalks.Talk

  @valid_attrs %{authtor: "some content", description: "some content", language: "some content", link: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Talk.changeset(%Talk{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Talk.changeset(%Talk{}, @invalid_attrs)
    refute changeset.valid?
  end
end
