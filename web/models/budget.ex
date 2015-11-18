defmodule CareCostManager.Budget do
  use CareCostManager.Web, :model

  schema "budgets" do
    field :year, :integer
    field :month, :integer
    field :location, :string
    field :annual_dollars, :decimal

    timestamps
  end

  @required_fields ~w(year month location annual_dollars)
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
end
