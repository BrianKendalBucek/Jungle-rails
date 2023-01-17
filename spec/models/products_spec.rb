require 'rails_helper'


RSpec.describe Product, type: :model do
  describe 'Validations' do

    it "Should return a product being all validations passed" do
      @category = Category.new

      new_product = Product.new(
        name: 'New Product',
        price_cents: 10000,
        quantity: 1,
        category: @category
      )
    expect(new_product).to be_valid
    end

    it "Should return an invalid product - no product name given" do
      @category = Category.new

      new_product = Product.new(
        price_cents: 9000,
        quantity: 1,
        category: @category
      )
    expect(new_product).to_not be_valid
    end

    it "Should return an invalid product - no price given" do
      @category = Category.new

      new_product = Product.new(
        name: 'Test',
        quantity: 1,
        category: @category
      )
    expect(new_product).to_not be_valid
    end

    it "Should return an invalid product - no quantity given" do
      @category = Category.new

      new_product = Product.new(
        name: 'Test',
        price_cents: 8000,
        category: @category 
      )
    expect(new_product).to_not be_valid
    end

    it "Should return an invalid product - no category" do
      @category = Category.new

      new_product = Product.new(
        name: 'Test',
        price_cents: 7000,
        quantity: 1
      )
    expect(new_product).to_not be_valid
    end

  end
end
