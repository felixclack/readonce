require 'spec_helper'

describe "Messages" do
  describe "creating a message", type: :feature do #process for validating new user
    before do
      sign_up
    end
      
    it "redirects to the messages index" do
      visit new_message_path #applies to whole app - describes actions you should take when running a test
      fill_in :message_body, with: 'Test' #capybara specific
      click_button 'Send' #capybara specific
      page.should have_content 'Test'  #verification step that is capybara specific
    end
    
    context 'without filling the body field' do #gives context to test
      it 'displays an error' do #gives context to test failure - gives state of app when failing
        visit new_message_path
        click_button 'Send'
        page.should have_content "can't be blank"
      end
    end
    
    context 'without specifying a receiver' do
      it 'displays an error' do
        visit new_message_path
        fill_in :message_body, with: 'Test'
        click_button 'Send'
        page.should have_content "Receiver can't be blank"
      end 
    end
  end
  
  describe "viewing a list of messages", type: :feature do
    before do
      another_user = create(:user, email: 'another@example.com') #create user account and password
      create(:message, sender: another_user, body: 'I am not yours') #create message and associate it to user and to not show user other users' messages
      sign_up #sign-up process - line 38
    end
  
    it "doesn't show other people's messages" do #to not show user anyone else's messages
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
    