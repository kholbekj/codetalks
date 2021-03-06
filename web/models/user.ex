defmodule Codetalks.User do
  use Codetalks.Web, :model

  schema "users" do
    field :name, :string
    field :email, :string
    field :github_id, :integer

    timestamps
  end

  @required_fields ~w(name github_id)
  @optional_fields ~w(email)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
