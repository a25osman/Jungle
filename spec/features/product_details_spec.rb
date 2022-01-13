require 'rails_helper'

RSpec.feature "Visitor navigates from home page to product detail page by clicking on a product", type: :feature, js: true do
  
    # SETUP
    before :each do
      @category = Category.create! name: 'Apparel'
  
      1.times do |n|
        @category.products.create!(
          name:  Faker::Hipster.sentence(3),
          description: Faker::Hipster.paragraph(4),
          image: open_asset('apparel1.jpg'),
          quantity: 10,
          price: 64.99
        )
        
      end
    end

    scenario "They see all products" do
      visit root_path
  
      page.find(:link, 'Details »').click
  
      expect(page).to have_text 'Quantity'
    end
end