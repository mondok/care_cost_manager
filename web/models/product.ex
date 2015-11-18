defmodule CareCostManager.Product do
  use CareCostManager.Web, :model

  schema "products" do
    field :description, :string
    field :category, :string
    field :sub_category, :string
    field :manufacturer, :string
    field :size, :string
    field :case_count, :float

    timestamps
  end

  @required_fields ~w(description category sub_category manufacturer size case_count)
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
