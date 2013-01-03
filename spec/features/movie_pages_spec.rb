require 'spec_helper'

describe "Movie pages" do

  subject { body }
  let(:user) { FactoryGirl.create(:admin) }
  let(:movie) { FactoryGirl.create(:movie) }

  describe "new movie page" do
    it_should_behave_like "accessible by admin", :new_movie_path

    before do
      sign_in(user)
      visit new_movie_path
    end

    it { should have_selector('h1',    text: 'New movie') }
    it { should have_selector('title', text: 'New movie') }
  end

  describe "movie info page" do
    before do
      sign_in(user)
      visit movie_path(movie)
    end

    it { should have_selector('h1',    text: movie.title) }
    it { should have_selector('title', text: movie.title) }
  end

end
