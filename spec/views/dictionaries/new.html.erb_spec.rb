require 'spec_helper'

describe "dictionaries/new" do
  before(:each) do
    assign(:dictionary, stub_model(Dictionary,
      :word => "MyString",
      :pronunciation => "MyString",
      :example => "MyText",
      :language_id => 1
    ).as_new_record)
  end

  it "renders new dictionary form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", dictionaries_path, "post" do
      assert_select "input#dictionary_word[name=?]", "dictionary[word]"
      assert_select "input#dictionary_pronunciation[name=?]", "dictionary[pronunciation]"
      assert_select "textarea#dictionary_example[name=?]", "dictionary[example]"
      assert_select "input#dictionary_language_id[name=?]", "dictionary[language_id]"
    end
  end
end
