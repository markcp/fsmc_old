require 'spec_helper'

describe "User pages" do

  subject { body }

  describe "signup page" do
    describe "for non-signed-in users" do:w

      before { visit signup_path }

      it { should have_selector('title', text: 'Sign in') }
    end

    describe "for non-admin user" do
      before do
        user = FactoryGirl.create(:user)
        sign_in user
        visit signup_path
      end

      it { should have_selector('title', text: 'Sign in') }
    end

    describe "for admin user" do
      before do
        user = FactoryGirl.create(:admin)
        sign_in user
        visit signup_path
      end

      it { should have_selector('h1',    text: 'Sign up') }
      it { should have_selector('title', text: full_title('Sign up')) }
    end
  end

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before do
      sign_in user
      visit user_path(user)
    end

    it { should have_selector('h1',    text: user.name) }
    it { should have_selector('title', text: user.name) }
  end

  describe "signup" do

    before do
      user = FactoryGirl.create(:admin)
      sign_in user
      visit signup_path
    end

    let(:submit) { "Create my account" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end

      describe "after submission" do
        before { click_button submit }

        it { should have_selector('title', text: 'Sign up') }
        it { should have_content('error') }
        it { should_not have_content('Password digest') }
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name",         with: "Example User"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end

      describe "after saving the user" do
        before do
          click_button submit
        end

        it { should have_selector('title', text: 'Skandies') }
        it { should have_selector('div.alert.alert-success', text: 'Success!') }
      end
    end
  end
end
