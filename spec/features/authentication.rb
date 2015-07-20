require 'spec_helper' 

feature "Signing up" do
  scenario "with correct credentials" do
    visit new_user_registration_path

    fill_in 'Email', with: 'user@rockcontent.com'
    fill_in 'Password', with: 'password123'
    fill_in 'First Name', with: 'Guilherme'
    fill_in 'Last Name', with: 'Araujo'

    click_button 'Sign in'
    expect(page).to have_content 'You have successfully created your account'
  end
end