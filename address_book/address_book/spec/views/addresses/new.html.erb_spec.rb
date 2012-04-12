require 'spec_helper'

describe "addresses/new" do
  before(:each) do
    assign(:address, stub_model(Address).as_new_record)
  end

  it "renders new address form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => addresses_path, :method => "post" do
    end
  end
end
