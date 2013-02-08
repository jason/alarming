require 'spec_helper'


feature "Visitor signs up" do
  subject { page }
  before { visit new_user_path }
  scenario 'with valid email and phone number' do
    sign_up_with('technique@gmail.com', '4155551212')

    expect.to have_content('Sign out')


  end
  def sign_up_with(email, phone)
    fill_in 'Email', with: email
    fill_in 'Phone', with: phone
    click_button 'Create User'
  end
  describe "signup page" do
    it { should have_content("Sign Up") }
  end
end