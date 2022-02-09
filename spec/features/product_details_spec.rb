require 'rails_helper'

RSpec.feature "Visitor navigates to product page from homepage by clicking a product", type: :feature, js: do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    17.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end


end
