require 'spec_helper'

describe Year do
  before { @year = Year.new( name: "2012", start_voting_at: "2013-01-01 00:00:00", end_voting_at: "2013-01-31 00:00:00") }

  subject { @year }

  it { should respond_to(:name) }
  it { should respond_to(:start_voting_at) }
  it { should respond_to(:end_voting_at) }
  it { should respond_to(:start_results_display_at) }

  describe "movie associations" do

    before { @year.save }

    let!(:movie_1) do
      FactoryGirl.create(:movie, year: @year, title: "Superman")
    end
    let!(:movie_2) do
      FactoryGirl.create(:movie, year: @year, title: "The Master")
    end

    it "should have movies in the right alphabetical order by title_sort" do
      @year.movies.should == [movie_2, movie_1]
    end
  end

  describe "voting and results display times" do



  end

end
