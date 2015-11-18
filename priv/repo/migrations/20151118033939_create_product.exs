defmodule CareCostManager.Repo.Migrations.CreateProduct do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :description, :text
      add :category, :string
      add :sub_category, :string
      add :manufacturer, :string
      add :size, :string
      add :case_count, :float

      timestamps
    end

  end
end
