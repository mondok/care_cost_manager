defmodule CareCostManager.Stock do
  use CareCostManager.Web, :model

  schema "stocks" do
    field :room_number, :string
    field :description, :string
    field :size, :string
    field :shift, :string
    belongs_to :product, CareCostManager.Product
    belongs_to :resident, CareCostManager.Resident

    timestamps
  end

  @required_fields ~w(room_number description size shift)
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
