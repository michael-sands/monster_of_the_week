require 'spec_helper'

describe "News pages" do

  subject { page }
  
  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  

  describe "News page" do
    before { visit news_path }
    
    describe "should see news" do
      before { 250.times { FactoryGirl.create(:news) } }
      
      it { should have_selector("div.pagination") }
      
      it "should show all news items" do
        News.paginate(page:1).each do |newsitem|
          expect(page).to have_selector('h2', text: newsitem.title)
        end
      end
    end
  end

end
