require 'spec_helper'

describe "Messages" do
  describe "POST /messages" do
    it "creates a message" do
      post messages_path, message: { body: 'Test' }
      Message.first.body.should eq 'Test'
    end
  end
end
