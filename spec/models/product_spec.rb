require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it 'successfully saves a product with all required fields present' do
      @category = Category.create!(name: 'Electronics')
      @product = Product.create!(name: 'iPhone', price_cents: 2000000, quantity: 4, category: @category)

      # checks to see if product newly created was successfully saved in database
      expect(Product.exists?(@product.id)).to be_truthy
    end

  end
end
