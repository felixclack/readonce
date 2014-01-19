require 'spec_helper'

describe "Messages" do
  describe "creating a message", type: :feature do
    before do
      sign_up
    end
    
    it "redirects to the messages index" do
      visit new_message_path
      fill_in :message_body, with: 'Test'
      click_button 'Send'
      page.should have_content 'Test'
    end
    
    context 'without filling the body field' do
      it 'displays an error' do
        visit new_message_path
        click_button 'Send'
        page.should have_content "can't be blank"
      end
    end
  end
  
  describe "viewing a list of messages", type: :feature do
    before do
      another_user = create(:user, email: 'another@example.com')
      create(:message, sender: another_user, body: 'I am not yours')
      sign_up
    end
    
    it "doesn't show other people's messages" do
      visit messages_path
      page.should_not have_content "I am not yours"
    end
  end
  
  def sign_up
    visit new_user_registration_path
    fill_in :user_email, with: 'me@example.com'
    fill_in :user_password, with: 'password'
    fill_in :user_password_confirmation, with: 'password'
    click_button 'Sign up'
  end

end
