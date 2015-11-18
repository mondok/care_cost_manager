defmodule CareCostManager.ProductTest do
  use CareCostManager.ModelCase

  alias CareCostManager.Product

  @valid_attrs %{case_count: "120.5", category: "some content", description: "some content", manufacturer: "some content", size: "some content", sub_category: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Product.changeset(%Product{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Product.changeset(%Product{}, @invalid_attrs)
    refute changeset.valid?
  end
end
