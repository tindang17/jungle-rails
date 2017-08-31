require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
  # SETUP
  before :each do
    @user = User.create!(
      first_name: 'T',
      last_name: 'D',
      email: 't@d.com',
      password: '123456',
      password_confirmation: '123456'
    )
    
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @product = @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end
  scenario "They can see their cart" do
    # ACT
    visit root_path

    first('article.product').find_link('Add').click

    visit cart_path

    # page.find_button('Pay with Card').click

    sleep 2
    # DEBUG
    save_screenshot ('cart.png')

    # VERIFY
    expect(page).to have_button 'Pay with Card'
  end
end
