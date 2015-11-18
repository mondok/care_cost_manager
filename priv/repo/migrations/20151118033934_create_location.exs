defmodule CareCostManager.Repo.Migrations.CreateLocation do
  use Ecto.Migration

  def change do
    create table(:locations) do
      add :building, :string
      add :domain, :string
      add :wing_unit, :string
      add :room_number, :string

      timestamps
    end

  end
end
