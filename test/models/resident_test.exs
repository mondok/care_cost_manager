defmodule CareCostManager.ResidentTest do
  use CareCostManager.ModelCase

  alias CareCostManager.Resident

  @valid_attrs %{first_name: "some content", last_name: "some content", room_number: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Resident.changeset(%Resident{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Resident.changeset(%Resident{}, @invalid_attrs)
    refute changeset.valid?
  end
end
