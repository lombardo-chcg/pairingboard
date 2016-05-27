require 'rails_helper'

feature "user sees index page of offerings" do
  let!(:user){User.create(email: "dom@bob.com", password: "password", name: "Bob", current_phase: 4)}
  let!(:user2){User.create(email: "bob@bob.com", password: "password", name: "Dominick", current_phase: 3)}
  let!(:user3){User.create(email: "bob2@bob.com", password: "password", name: "Other Bob", current_phase: 2)}
  let!(:offering){ user.offerings.create(offering_date: "28-05-2016", start_time: "10:00") }
  let!(:offering2){ user2.offerings.create(offering_date: "28-05-2016", start_time: "10:30") }
  let!(:offering3){ user.offerings.create(offering_date: "28-05-2016", start_time: "11:00") }
  let!(:offering4){ user.offerings.create(offering_date: "28-05-2016", start_time: "11:30") }
  let!(:offering5){ user.offerings.create(offering_date: "28-05-2016", start_time: "12:00") }
  let!(:offering6){ user.offerings.create(offering_date: "28-05-2016", start_time: "12:30") }
  let!(:offering7){ user.offerings.create(offering_date: "28-05-2016", start_time: "1:00") }
  let!(:offering8){ user.offerings.create(offering_date: "28-05-2016", start_time: "1:30") }
  let!(:appointment){ user2.appointments.create(offering_id: offering.id) }
  let!(:appointment2){ user3.appointments.create(offering_id: offering2.id) }

  scenario "user can click on button and offer to mentor" do
    visit '/'
    click_button 'Offer To Mentor'
    expect(page).to have_css(".modal-content")
  end

  scenario "user sees a form to select date and time slots " do
    visit '/login'
    within('form') do
      fill_in 'Password', with:"password"
      fill_in 'Email', with:"dom@bob.com"
    end
    click_button 'Login'
    visit '/'
    click_button 'Offer To Mentor'
    within('form') do
      fill_in 'date', with:"28-05-2016"
      check('offering_tag[9:30]')
    end
    click_button 'Submit'
    expect(page).to have_css('button.name_button')
  end

  scenario "student can see a booked appointment" do
    visit '/login'
    within('form') do
      fill_in 'Password', with:"password"
      fill_in 'Email', with:"bob@bob.com"
    end
    click_button 'Login'
    visit '/'
    expect(page).to have_css("a.taken_offering_link")
  end

  scenario "student can see an open offering" do
    visit '/login'
    within('form') do
      fill_in 'Password', with:"password"
      fill_in 'Email', with:"bob@bob.com"
    end
    click_button 'Login'
    visit '/'
    expect(page).to have_css("a.open_offering_link")
  end
  
end






