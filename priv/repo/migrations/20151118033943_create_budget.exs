defmodule CareCostManager.Repo.Migrations.CreateBudget do
  use Ecto.Migration

  def change do
    create table(:budgets) do
      add :year, :integer
      add :month, :integer
      add :location, :string
      add :annual_dollars, :decimal

      timestamps
    end

  end
end
