require 'spec_helper'

describe Article do

  let(:user) { FactoryGirl.create(:user) }
  before { @article = user.articles.new(title: 'Title', body: 'Article body is here.') }
  
  subject { @article }
  
  it { should respond_to(:title) }
  it { should respond_to(:body) }
  
  it { should respond_to(:user) }
  its(:user) { should eq user }
  
  describe "no title" do
    before { @article.title = nil }
    it { should_not be_valid }
  end
  
  describe "no body" do
    before { @article.body = nil }
    it { should_not be_valid }
  end
  
  describe "body too short" do
    before { @article.body = 'short' }
    it { should_not be_valid }
  end
end
