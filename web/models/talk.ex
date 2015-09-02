defmodule Codetalks.Talk do
  use Codetalks.Web, :model

  schema "talks" do
    field :name, :string
    field :description, :string
    field :authtor, :string
    field :language, :string
    field :link, :string

    timestamps
  end

  @required_fields ~w(name description authtor language link)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end

  def embedded_link(talk) do
    %{"video" => video, "youtube" => youtube } = Regex.named_captures ~r/(?<youtube>.+?youtube\..+?)\/watch\?v=(?<video>.+?)(&|$)/, talk.link
    "#{youtube}/embed/#{video}"
  end
end
