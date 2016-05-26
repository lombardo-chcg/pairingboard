require 'rails_helper'

feature "user sees index page of offerings" do
  let!(:user){User.create(email: "dom@bob.com", password: "bob", name: "Bob")}
  scenario "user can click on button and offer to mentor" do
    visit '/'
    click_button 'Offer To Mentor'
    expect(page).to have_css(".modal-content")
  end

  scenario "user sees a form to select date and time slots " do
    visit '/'

    # user.offerings.create(start_time: "9:00", end_time: "9:30")
    click_button 'Offer To Mentor'
    within('form') do
      fill_in 'Start Time', with:"10:00"
      fill_in 'End Time', with:"12:00"
    end
    click_button 'Submit'
    expect(page).to have_css("#user1")
  end

end
