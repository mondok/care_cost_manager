defmodule CareCostManager.PlannedUsage do
  use CareCostManager.Web, :model

  schema "planned_usages" do
    field :size, :string
    field :shift, :string
    field :usage, :string
    field :transaction_date, Ecto.DateTime
    belongs_to :resident, CareCostManager.Resident
    belongs_to :product, CareCostManager.Product

    timestamps
  end

  @required_fields ~w(size shift usage transaction_date)
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
