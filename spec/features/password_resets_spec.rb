require 'spec_helper'

describe "password resets" do
  subject { body }
  let(:user) { FactoryGirl.create(:user) }

  describe "with valid information" do
    before do
      visit signin_path
      click_link "password"
      fill_in "Email", :with => user.email
      click_button "Reset/change password"
    end

    it { should have_content("Email sent") }

    it "should send an email" do
      expect(last_email.to).to include(user.email)
    end
  end

  describe "with invalid information" do
    before do
      visit signin_path
      click_link "password"
      fill_in "Email", :with => "madeupuser@example.com"
      click_button "Reset/change password"
    end

    it { should have_content("Email sent") }

    it "should not send an email" do
      expect(last_email).should be_nil
    end
  end

  it "updates the user password when confirmation matches" do
    user = FactoryGirl.create(:user, :password_reset_token => "something", :password_reset_sent_at => 1.hour.ago)
    visit edit_password_reset_path(user.password_reset_token)
    fill_in "Password", :with => "foobar"
    click_button "Update Password"
    page.should have_content("Password doesn't match confirmation")
    fill_in "Password", :with => "foobar"
    fill_in "Confirmation", :with => "foobar"
    click_button "Update Password"
    page.should have_content("Password has been reset")
  end

  it "reports when password token has expired" do
    user = FactoryGirl.create(:user, :password_reset_token => "something", :password_reset_sent_at => 5.hour.ago)
    visit edit_password_reset_path(user.password_reset_token)
    fill_in "Password", :with => "foobar"
    fill_in "Confirmation", :with => "foobar"
    click_button "Update Password"
    page.should have_content("Password reset has expired")
  end

  it "raises record not found when password token is invalid" do
    lambda {
      visit edit_password_reset_path("invalid")
    }.should raise_exception(ActiveRecord::RecordNotFound)
  end
end
