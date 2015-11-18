defmodule CareCostManager.Repo.Migrations.CreatePlannedUsage do
  use Ecto.Migration

  def change do
    create table(:planned_usages) do
      add :size, :string
      add :shift, :string
      add :usage, :string
      add :transaction_date, :datetime
      add :resident_id, references(:residents)
      add :product_id, references(:products)

      timestamps
    end
    create index(:planned_usages, [:resident_id])
    create index(:planned_usages, [:product_id])

  end
end
