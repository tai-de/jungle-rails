require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "Validations" do

    before(:each) do
      @category = Category.create!(name: 'Foliage')
      @product = @category.products.new(name: 'Plant', price_cents: 10000, quantity: 10)
    end
    
    it "saves successfully when all fields are valid" do
      expect(@product.save!).to be true\
    end

    it "fails when name is empty" do
      @product.name = nil
      @product.save
      expect(@product.errors[:name]).to include("can't be blank")
    end

    it "fails when price is empty" do
      @product.price_cents = nil
      @product.save
      expect(@product.errors[:price]).to include("can't be blank")
      
    end

    it "fails when quantity is empty" do
      @product.quantity = nil
      @product.save
      expect(@product.errors[:quantity]).to include("can't be blank")
    end

    it "fails when category is empty" do
      @product.category = nil
      @product.save
      expect(@product.errors[:category]).to include("can't be blank")
    end
  end
end
