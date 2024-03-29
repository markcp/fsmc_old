require 'spec_helper'

describe "Static Pages" do

  subject { body }

  shared_examples_for "all static pages" do
    it { should have_selector('h1', text: heading) }
    it { should have_title(full_title(page_title)) }
  end

  describe "Home page" do
    before { visit root_path }
    let(:heading) { 'Fireman Save My Child' }
    let(:page_title) { '' }


    it_should_behave_like "all static pages"
    it { should_not have_title('| Home') }
  end

  describe "About page" do
    before { visit about_path }
    let(:heading) { 'About' }
    let(:page_title) { 'About' }

    it_should_behave_like "all static pages"
    it { should have_title(full_title('About')) }
  end

  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    body.should have_title(full_title('About'))
    click_link "Fireman Save My Child"
    body.should have_title(full_title(''))
  end

end
