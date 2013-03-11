require 'spec_helper'

describe "Movie pages" do

  subject { body }
  let(:user) { FactoryGirl.create(:admin) }
  let(:movie) { FactoryGirl.create(:movie) }

  describe "new movie page" do
    it_should_behave_like "accessible by admin", :new_movie_path

    context "authenticated user" do
      it "displays page" do
        sign_in(user)
        visit new_movie_path
        body.should have_selector('h1',    text: 'New movie')
        body.should have_selector('title', text: 'New movie')
      end
    end

    # before do
    #   sign_in(user)
    #   visit new_movie_path
    # end

  end

  describe "movie info page" do
    before do
      sign_in(user)
      visit movie_path(movie)
    end

    it { should have_selector('h1',    text: movie.title) }
    it { should have_selector('title', text: movie.title) }
  end

  describe "movie creation" do
    before do
      sign_in(user)
      visit new_movie_path
    end

    describe "with invalid information" do

      it "should not create a movie" do
        expect { click_button "Create movie" }.not_to change(Movie, :count)
      end

      describe "error messages" do
        before { click_button "Create movie" }
        it { should have_content('error') }
      end
    end

    describe "with valid information" do

      before do
        fill_in 'title', with: 'example movie'
        select '2012', from: 'Year'
        fill_in 'director_display', with: 'a pair of directors'
        fill_in 'screenwriter_display', with: 'a pair of screenwriters'
      end
      it "should create a movie" do
        expect { click_button "Add movie" }.to change(Movie, :count).by(1)
      end
    end
  end
end
