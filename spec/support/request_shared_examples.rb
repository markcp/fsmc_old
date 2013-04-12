shared_examples "accessible by admin" do |url|
  let(:url_path) { send(url) }

  subject { body }

  describe "unauthenticated user redirects to home page" do
    before do
      visit url_path
    end
    it { should have_title('Fireman Save My Child') }
  end

  describe "authorized user displays page" do
    before do
      user = FactoryGirl.create(:user)
      sign_in(user)
      visit url_path
    end
    it { should_not have_title('Sign in') }
  end
end
