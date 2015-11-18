defmodule CareCostManager.LocationTest do
  use CareCostManager.ModelCase

  alias CareCostManager.Location

  @valid_attrs %{building: "some content", domain: "some content", room_number: "some content", wing_unit: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Location.changeset(%Location{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Location.changeset(%Location{}, @invalid_attrs)
    refute changeset.valid?
  end
end
