require 'spec_helper'

describe File do
  before { @file = File.new(name: 'filename.pdf', display_name: 'Filename', access_id: 0) }
  
  subject { @file }
  
  it { should respond_to(:name) }
  it { should respond_to(:display_name) }
  it { should respond_to(:access_id) }
  
  describe "no name" do
    before { @file.name = nil }
    it { should_not be_valid }
  end
  
  describe "no display name" do 
    before { @file.display_name = nil }
    it { should be_valid }
  end

  describe "no access id" do
    before { @file.access_id = nil }
    it { should_not be_valid }
  end

end
