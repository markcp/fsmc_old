require 'spec_helper'

describe "Authentication" do

  subject { page.body }
  let(:user) { FactoryGirl.create(:user) }

  describe "signin page" do
    before { visit signin_path }

    it { should have_selector('h1',    text: 'Sign in') }
    it { should have_selector('title', text: 'Sign in') }
  end

  describe "signin" do
    before { visit signin_path }

    describe "with invalid information" do
      before { click_button "Sign in" }

      it { should have_selector('title', text: 'Sign in') }
      it { should have_error_message('Invalid') }
    end

    describe "after visiting another page" do
      before { click_link "Skandies" }
      it { should_not have_selector('div.alert.alert-error') }
    end

    describe "with valid information" do
      before { sign_in(user) }

      it { should have_selector('title', text: user.name) }
      it { should have_link('Sign out', href: signout_path) }
      it { should_not have_link('Sign in', href: signin_path) }

      describe "followed by signout" do
        before { click_link "Sign out" }
        it { should have_link('Sign in') }
      end
    end
  end

  describe "authorization" do

    describe "for non-signed-in users" do
      let(:user) { FactoryGirl.create(:user) }

      describe "in the Users controller" do

        describe "visiting the show page" do
          before { visit user_path(user) }
          it { should have_selector('title', text: 'Sign in') }
        end
      end
    end
  end

  describe "as wrong user" do
    let(:user) { FactoryGirl.create(:user) }
    let(:wrong_user) { FactoryGirl.create(:user, email: "wrong@example.com") }
    before { sign_in user }

    describe "visiting Users#show page" do
      before { visit user_path(wrong_user) }
      it { should_not have_selector('title', text: user.name) }
    end
  end
end
