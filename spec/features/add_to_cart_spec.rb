require 'rails_helper'

RSpec.feature "Visitor can add products to their cart", type: :feature, js: true do
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

    scenario "They click a product's 'Add' button and their cart in the navbar increases by 1" do
      # ACT
      visit root_path
      random_product_add_button = page.all('button.add-product').sample

      # DEBUG / VERIFY
    end
end
