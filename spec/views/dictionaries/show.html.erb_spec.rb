require 'spec_helper'

describe "dictionaries/show" do
  before(:each) do
    @dictionary = assign(:dictionary, stub_model(Dictionary,
      :word => "Word",
      :pronunciation => "Pronunciation",
      :example => "MyText",
      :language_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Word/)
    rendered.should match(/Pronunciation/)
    rendered.should match(/MyText/)
    rendered.should match(/1/)
  end
end
