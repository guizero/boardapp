require 'spec_helper' 

feature "Signing up" do
  scenario "with all information" do
    visit new_user_registration_path

    fill_in 'Email', with: 'user@rockcontent.com'
    fill_in 'First Name', with: 'Guilherme'
    fill_in 'Last Name', with: 'Araujo'
    fill_in 'Password', with: 'password123'
    fill_in 'Password confirmation', with: 'password123'

    click_button 'Sign up'
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end
end

feature "Signing in" do
  let!(:user) { FactoryGirl.create(:user) }

  scenario "with correct credentials", :js => :true do
    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully.'
  end

  scenario "with incorrect credentials", :js => :true do
    visit new_user_session_path

    fill_in 'Email', with: 'wrong@email.com'
    fill_in 'Password', with: 'wrongpassword'

    click_button 'Log in'
    expect(page).not_to have_content 'Signed in successfully.'
  end

  scenario "with incorrect password", :js => :true do
    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'wrongpassword'

    click_button 'Log in'
    expect(page).not_to have_content 'Signed in successfully.'
  end
end