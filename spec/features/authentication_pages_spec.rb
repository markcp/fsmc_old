require 'spec_helper'

describe "Authentication" do

  subject { page.body }
  let(:user) { FactoryGirl.create(:user) }

  describe "signin page" do
    before { visit signin_path }

    it { should have_field('') }
  end

  describe "signin" do
    before { visit signin_path }

    describe "with invalid information" do
      before { click_button "Sign in" }

      it { should have_field("") }
      it { should have_error_message('Invalid') }

      describe "after visiting another page" do
        before { visit root_path }
        it { should_not have_selector('div.alert.alert-error') }
      end
    end

    describe "with valid information" do
      before { valid_signin(user) }

      it { should have_selector('h1', 'New viewing') }
      it { should have_link('Sign out', href: signout_path) }

      describe "followed by signout" do
        before { click_link "Sign out" }
        it { should have_title('Home') }
      end
    end
  end
end
