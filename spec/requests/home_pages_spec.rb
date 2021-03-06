require 'spec_helper'
#
# These unit tests cover the home page and the other static content (About, Contact, etc)
#

describe "home pages" do
  subject { page }

  shared_examples_for "all home pages" do
    it { should have_selector('h1', text: heading) }
    it { should have_title(full_title(page_title)) }
  end

  describe "base page" do 
    before { visit root_path }
    
    let(:heading) { 'Monster of the Week' }
    let(:page_title) { '' }
    
    it_should_behave_like "all home pages"
    it { should_not have_title('| Home') }
    
  end
  
  

end