require 'spec_helper'

describe Configuration do
  before(:each) do
    @valid_attributes = {
      
    }
  end

  it "should create a new instance given valid attributes" do
    Configuration.create!(@valid_attributes)
  end
end
