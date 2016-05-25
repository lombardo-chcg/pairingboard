require 'rails_helper'



feature "user is able to login and logout" do
  let!(:user){User.create(email: "dom@bob.com", password: "bob", name: "Bob")}
  scenario "user sees profile" do
    visit '/login'
    within('form') do
      fill_in 'Password', with:"bob"
      fill_in 'Email', with:"dom@bob.com"
    end
    click_button 'Login'
    expect(page).to have_content "Bob's Profile!"
  end

  scenario "user is able to logout" do
    visit '/login'
    within('form') do
      fill_in 'Password', with:"bob"
      fill_in 'Email', with:"dom@bob.com"
    end
    click_button 'Login'
    click_link 'Logout'
    expect(page).to have_content "Register"
  end

end

feature "user is able to register" do
  scenario "user is able to create a profile" do
    visit '/users/new'
    within('form') do
      fill_in 'Password', with:"bob"
      fill_in 'Email', with:"dom@bob.com"
      fill_in 'Name', with: "Bob"
    end
    click_button "Register"
    expect(page).to have_content "Bob's Profile!"

  end
end
