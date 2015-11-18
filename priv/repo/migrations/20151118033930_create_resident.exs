defmodule CareCostManager.Repo.Migrations.CreateResident do
  use Ecto.Migration

  def change do
    create table(:residents) do
      add :first_name, :string
      add :last_name, :string
      add :room_number, :string

      timestamps
    end

  end
end
