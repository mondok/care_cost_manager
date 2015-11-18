defmodule CareCostManager.Location do
  use CareCostManager.Web, :model

  schema "locations" do
    field :building, :string
    field :domain, :string
    field :wing_unit, :string
    field :room_number, :string

    timestamps
  end

  @required_fields ~w(building domain wing_unit room_number)
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
