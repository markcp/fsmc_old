shared_examples "accessible by admin" do |url|
  let(:url_path) { send(url) }

  subject { body }

  describe "unauthenticated user redirects to signin page" do
    before do
      visit url_path
    end
    it { should have_selector('title', text: 'Sign in') }
  end

  describe "unauthorized user redirects to signin page" do
    before do
      user = FactoryGirl.create(:user)
      sign_in(user)
      visit url_path
    end
    it { should have_selector('title', text: 'Sign in') }
  end

  describe "authorized user displays page" do
    before do
      user = FactoryGirl.create(:admin)
      sign_in(user)
      visit url_path
    end
    it { should_not have_selector('title', text: 'Sign in') }
  end
end
