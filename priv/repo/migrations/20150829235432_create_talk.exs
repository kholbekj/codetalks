defmodule Codetalks.Repo.Migrations.CreateTalk do
  use Ecto.Migration

  def change do
    create table(:talks) do
      add :name, :string
      add :description, :text
      add :authtor, :string
      add :language, :string
      add :link, :string

      timestamps
    end

  end
end
