require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do
  # SETUP
  before :each do
    User.create!(
      first_name: "First",
      last_name: "Last",
      email: "test@test.com",
      password: "test",
      password_confirmation: "test"
    )

    @category = Category.create! name: 'Apparel'

    @category.products.create!(
      name:  Faker::Hipster.sentence(3),
      description: Faker::Hipster.paragraph(4),
      image: open_asset('apparel1.jpg'),
      quantity: 10,
      price: 64.99
    )
  end

  scenario "They login and see email in navbar" do
    # ACT
    visit '/login'

    within 'form' do
      fill_in id: "email", with: "test@test.com"
      fill_in id: "password", with: "test"

      click_button "Login"
    end
    # DEBUG / VERIFY
    # save_screenshot

    expect(page).to have_text "Logged in as test@test.com"
    expect(page).to have_css 'article.product'
  end

end
