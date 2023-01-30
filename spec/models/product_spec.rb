require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "Validations" do
    
    it "saves successfully when all fields are valid" do
      @category = Category.create!(name: 'Foliage')
      @product = @category.products.new(name: 'Plant', price_cents: 10000, quantity: 10)
      expect(@product.save!).to be true
      # @product_found = Product.find_by(name: 'Plant')
      # pp @product_found
    end

    it "fails when name is empty" do
      @category = Category.create!(name: 'Foliage')
      @product = @category.products.new(name: nil, price_cents: 10000, quantity: 10)
      @product.save
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it "fails when price is empty" do
      @category = Category.create!(name: 'Foliage')
      @product = @category.products.new(name: 'Plant', price_cents: nil, quantity: 10)
      @product.save
      expect(@product.errors.full_messages).to include("Price can't be blank")
      
    end

    it "fails when quantity is empty" do
      @category = Category.create!(name: 'Foliage')
      @product = @category.products.new(name: 'Plant', price_cents: 10000, quantity: nil)
      @product.save
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it "fails when category is empty" do
      @category = Category.create!(name: 'Foliage')
      @product = Product.new(name: 'Plant', price_cents: 10000, quantity: 10)
      @product.save
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
