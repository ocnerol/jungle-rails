require 'rails_helper'
require 'pp'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    before(:all) do
      @category = Category.create!(name: 'Electronics')
    end

    it 'successfully saves a product with all required fields present' do
      @product = Product.create!(name: 'iPhone', price_cents: 2000000, quantity: 4, category: @category)
      
      # checks to see if product newly created was successfully saved in database
      expect(Product.exists?(@product.id)).to be_truthy
    end
    
    it 'raises an error if name is not provided' do
      @product = Product.create(price_cents: 4000000, quantity: 3, category: @category)
      errors  = @product.errors.full_messages
      
      expect(errors).to include("Name can't be blank")
    end
    
    it 'raises an error if price is not provided' do
      @product = Product.new(name: 'iPad', quantity: 32, category: @category)

      expect(@product.valid?).to be_falsey      
    end
    
    it 'raises an error if quantity is not provided' do
      @product = Product.new(name: 'TV', price_cents: 330000000, category: @category)

      expect(@product.valid?).to be_falsey
    end

    it 'raises an error if category is not provided' do
      @product = Product.new(name: 'Smart Watch', price_cents: 321200000, quantity: 43)
      
      expect(@product.valid?).to be_falsey
    end

  end
end
