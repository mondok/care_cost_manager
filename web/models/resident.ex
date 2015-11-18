defmodule CareCostManager.Resident do
  use CareCostManager.Web, :model

  schema "residents" do
    field :first_name, :string
    field :last_name, :string
    field :room_number, :string

    timestamps
  end

  @required_fields ~w(first_name last_name room_number)
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
