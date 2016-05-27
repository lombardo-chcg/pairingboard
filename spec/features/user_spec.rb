require 'rails_helper'

feature "user is able to login and logout" do
  let!(:user){User.create(email: "dom@bob.com", password: "password", name: "Bob")}
  scenario "user sees profile" do
    visit '/login'
    within('form') do
      fill_in 'Password', with:"password"
      fill_in 'Email', with:"dom@bob.com"
    end
    click_button 'Login'
    expect(page).to have_content "Bob's Profile!"
  end

  scenario "user is able to logout" do
    visit '/login'
    within('form') do
      fill_in 'Password', with:"password"
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
      fill_in 'Password', with:"password"
      fill_in 'Email', with:"dom@bob.com"
      fill_in 'Name', with: "Bob"
    end
    click_button "Register"
    expect(page).to have_content "Bob's Profile!"
  end
end

feature 'user has a dynamic profile' do
  let!(:user){User.create(email: "dom@bob.com", password: "password", name: "Bob")}
  let!(:user2){User.create(email: "bob@bob.com", password: "password", name: "Other Bob")}
  let!(:offering){ user.offerings.create(offering_date: "28-05-2016", start_time: "9:00") }
  let!(:offering2){ user2.offerings.create(offering_date: "28-05-2016", start_time: "9:30") }
  let!(:offering3){ user.offerings.create(offering_date: "28-05-2016", start_time: "10:00") }
  let!(:appointment){ user2.appointments.create(offering_id: offering.id) }
  let!(:appointment2){ user.appointments.create(offering_id: offering2.id) }
  scenario 'user is able to edit their profile' do
    visit '/login'
    within('form') do
      fill_in 'Email', with:"dom@bob.com"
      fill_in 'Password', with:"password"
    end
    click_button 'Login'
    click_link 'Edit Your Profile'
    within('form') do
      select('2', :from => 'Current phase')
      fill_in 'Phone number', with:"123-456-7890"
      fill_in 'I\'d like to mentor on these topics:', with:"I want to mentor on Rails"
    end
    click_button 'Update Your Profile'
    expect(page).to have_content "I want to mentor on Rails"
  end

  scenario 'user is able to see their mentoring appointments' do
    visit '/login'
    within('form') do
      fill_in 'Email', with:"dom@bob.com"
      fill_in 'Password', with:"password"
    end
    click_button 'Login'
    expect(page).to have_content "Dropping Knowledge On:"
  end

  scenario 'user is able to see their student appointments' do
    visit '/login'
    within('form') do
      fill_in 'Email', with:"dom@bob.com"
      fill_in 'Password', with:"password"
    end
    click_button 'Login'
    expect(page).to have_content "Learning From:"
  end

  scenario 'user is able to see their open mentoring appointments' do
    visit '/login'
    within('form') do
      fill_in 'Email', with:"dom@bob.com"
      fill_in 'Password', with:"password"
    end
    click_button 'Login'
    expect(page).to have_content "Open Appointments:"
  end

end



