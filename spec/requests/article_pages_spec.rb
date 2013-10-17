require 'spec_helper'

describe "Articles pages" do

  subject { page }
  
  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "Add article" do
    describe "admin can add articles" do 
      let(:admin) { FactoryGirl.create(:admin) }
      before do
        sign_in admin
      end
      
      describe "should show new article link" do 
        before { visit articles_path }
        
        it { should have_link('New Article') }
      end
      
      it "should allow article to be entered" do
        # add new item here
      end
    end
  end

  describe "Articles page" do
    before { visit articles_path }
    
    describe "title" do
      it { should have_selector('h1', 'News') }
    end
    
    describe "pagination" do
      before { 11.times { FactoryGirl.create(:article) } }
      
      it { should have_selector("div.pagination") }
      
      it "should show all articles" do
        Article.paginate(page:1).each do |article|
          expect(page).to have_selector('h2', text: article.title)
        end
      end
    end    
  end

end
