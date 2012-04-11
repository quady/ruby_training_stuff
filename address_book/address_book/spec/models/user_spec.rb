require 'spec_helper'

describe User do
  it "requires a first name" do
    u = User.new
    u.should_not be_valid
    u.errors[:first_name].should_not be_empty
  end
  it "requires a last name" do
    u = User.new
    u.should_not be_valid
    u.errors[:last_name].should_not be_empty
  end
  it 'can create an address from the user' do
    u = FactoryGirl.create(:user)
    expect {
      u.addresses.create(city: "Bend", state: "OR", street: "123 Street", zip: "12345")
    }.to change{u.addresses.count}.by(1)
  end
  it "can have many addresses" do
    u = FactoryGirl.create(:user)
    u.addresses.create(city: "Bend", state: "OR", street: "123 Street", zip: "12345")
    u.addresses.create(city: "Bend2", state: "OR", street: "1234 Street", zip: "12345")
    u.addresses.count.should == 2
  end
  it "does not have to have any addresses" do
    u = FactoryGirl.create(:user)
    u.addresses.count.should == 0
  end
end
