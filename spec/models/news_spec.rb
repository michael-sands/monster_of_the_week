require 'spec_helper'

describe News do
  before { @news = News.new(title: 'Title', body: 'Article body is here.') }
  
  subject { @news }
  
  it { should respond_to(:title) }
  it { should respond_to(:body) }
  
  describe "no title" do
    before { @news.title = nil }
    it { should_not be_valid }
  end
  
  describe "no body" do
    before { @news.body = nil }
    it { should_not be_valid }
  end
  
  describe "body too short" do
    before { @news.body = 'short' }
    it { should_not be_valid }
  end
end
