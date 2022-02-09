require 'rails_helper'

RSpec.feature "Visitor navigates to product page from homepage by clicking a product", type: :feature, js: true do

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

  scenario "They navigate to product page when clicking a product's details button" do
    # ACT
    visit root_path
    random_product_details_button = page.all('a', text: 'Details').sample
    random_product_details_button.click

    # DEBUG / VERIFY
    expect(page).to have_css 'section.products-show'
    expect(page).to have_no_css 'article.product'
  end

  scenario "They navigate to product page when clicking a product's title" do
    # ACT
    visit root_path
    random_product_title = page.all('h4').sample
    random_product_title.click

    # DEBUG / VERIFY
    expect(page).to have_css 'section.products-show'
    expect(page).to have_no_css 'article.product'
  end


end
