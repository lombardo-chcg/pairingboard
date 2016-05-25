require 'rails_helper'

feature "user sees index page of offerings" do
  scenario "user can click on button and offer to mentor" do
    visit '/'
    click_button 'Offer To Mentor'
    expect(page).to have_css(".modal-content")
  end

  scenario "user sees a form to select date and time slots " do
    visit '/'
    click_button 'Offer To Mentor'
    expect(page).to have_css(".modal-content")
  end

end
