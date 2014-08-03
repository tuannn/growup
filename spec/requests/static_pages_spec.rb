require 'spec_helper'

describe "Static Pages" do
  describe " Home page" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get root_path
      response.status.should be(200)
    end
    
    it "should have the content 'Sample App'" do
      visit root_path
      expect(page).to have_content('Sample App')
    end
    
    it "should have the right title" do
      visit root_path
      expect(page).to have_title('Grow up yourself | Home')
    end
  
  end
  
  describe "Help page" do

    it "should have the content 'Help'" do
      visit '/static_pages/help'
      expect(page).to have_content('Help')
    end
  end
  
  describe "About page" do

    it "should have the content 'About Us'" do
      visit '/static_pages/about'
      expect(page).to have_content('About Us')
    end
  end
  
  describe "Contact page" do
    it "should have content 'Contact'" do
      visit '/static_pages/contact'
      expect(page).to have_content("Contact")
    end
  end  

end
