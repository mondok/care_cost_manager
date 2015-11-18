defmodule CareCostManager.StockTest do
  use CareCostManager.ModelCase

  alias CareCostManager.Stock

  @valid_attrs %{description: "some content", room_number: "some content", shift: "some content", size: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Stock.changeset(%Stock{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Stock.changeset(%Stock{}, @invalid_attrs)
    refute changeset.valid?
  end
end
