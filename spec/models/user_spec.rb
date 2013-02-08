require 'spec_helper'

describe User do

  subject (:user) { User.new }
  
  it { should respond_to(:email)}
  it { should respond_to(:phone_number)}

  describe "when email is not present" do

    before { user.email = " "}
    it { should_not be_valid}
  end

  describe "when number is not present" do
    before { user.phone_number = " " }
    
    it { should_not be_valid }
  end
  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        user.email = invalid_address
        should_not be_valid
      end
    end
  end

  describe "when email format is valid" do
    before { user.phone_number = "4155551212" }
    it "should be valid" do

      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      p addresses
      addresses.each do | valid_address |
        user.email = valid_address
        # how to figure out what the error is
         # p valid_address
         # p user.email
         #  p user.valid?
         #  p user.errors.full_messages
        should be_valid
      end
    end
  end

  describe "when email address is already taken" do
    before do
      user.email = "boo@boo.com"
      user.phone_number =  "4155551212"
      user_with_same_email = user.dup
      user_with_same_email.email = user.email.upcase
      #nil.email.upcase # => no method eail on nil
      #user.email.upcase # if user.email == nil, then no method upcase on nil
      user_with_same_email.save
    end

    it { should_not be_valid }

  end
end