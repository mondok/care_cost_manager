defmodule CareCostManager.Repo.Migrations.CreateStock do
  use Ecto.Migration

  def change do
    create table(:stocks) do
      add :room_number, :string
      add :description, :text
      add :size, :string
      add :shift, :string
      add :product_id, references(:products)
      add :resident_id, references(:residents)

      timestamps
    end
    create index(:stocks, [:product_id])
    create index(:stocks, [:resident_id])

  end
end
