require 'spec_helper'


describe "User Pages" do
  subject { page }
  describe "signup page" do
    before { visit '/users/new'; puts "i visited" }
    it { should have_content("Sign Up") }
  end
end