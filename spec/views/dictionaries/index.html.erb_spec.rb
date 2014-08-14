require 'spec_helper'

describe "dictionaries/index" do
  before(:each) do
    assign(:dictionaries, [
      stub_model(Dictionary,
        :word => "Word",
        :pronunciation => "Pronunciation",
        :example => "MyText",
        :language_id => 1
      ),
      stub_model(Dictionary,
        :word => "Word",
        :pronunciation => "Pronunciation",
        :example => "MyText",
        :language_id => 1
      )
    ])
  end

  it "renders a list of dictionaries" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Word".to_s, :count => 2
    assert_select "tr>td", :text => "Pronunciation".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
