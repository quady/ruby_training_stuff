require 'spec_helper'

describe Address do
  describe "require fields" do

    before do
      @a = Address.new
    end

    it "requires a city" do
      @a.should_not be_valid
      @a.errors[:city].should_not be_empty
    end

    it "requires a street" do
      @a.should_not be_valid
      @a.errors[:street].should_not be_empty
    end

    it "requires a state" do
      @a.should_not be_valid
      @a.errors[:state].should_not be_empty
    end

    it "requires a zip" do
      @a.should_not be_valid
      @a.errors[:zip].should_not be_empty
    end

    it "requires a user" do
      @a.should_not be_valid
      @a.errors[:user].should_not be_empty
    end

  end

  describe "has more validation" do

    before do
      @a = FactoryGirl.create(:address)
    end

    it "requires the zip to be a number" do
      @a.zip = "ABCDE"
      @a.should_not be_valid
      @a.errors[:zip].should_not be_empty
    end

    it "requires the state to be a two letter capitalized abbreviation" do
      @a.state = "Iowa"
      @a.should_not be_valid
      @a.errors[:state].should_not be_empty
    end

    it "requires the state to be a valid state" do
      @a.state = "QX"
      @a.should_not be_valid
      @a.errors[:state].should_not be_empty
    end
  end
  
  describe "Scopes" do
    before do
      @u1 = FactoryGirl.create(:user)
      @a1 = FactoryGirl.create(:address, :user_id => @u1.id)
      @a2 = FactoryGirl.create(:address, :user_id => @u1.id)
      @a3 = FactoryGirl.create(:address, :user_id => @u1.id, :state => "WA")
    end
    it "should return all addresses for a given state" do
      Address
    end

  end
end
