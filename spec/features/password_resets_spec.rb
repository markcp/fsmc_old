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
end
