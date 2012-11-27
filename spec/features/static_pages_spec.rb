require 'spec_helper'

describe "StaticPages" do

  let(:base_title) { "Skandies" }

  describe "Home page" do

    it "should have the content 'Skandies'" do
      visit '/static_pages/home'
      page.should have_content('Skandies')
    end

    it "should have the right title" do
      visit '/static_pages/home'
      body.should have_selector('title', text: "#{base_title} | Home")
    end
  end
end
