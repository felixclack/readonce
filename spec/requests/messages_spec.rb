require 'spec_helper'

describe "Messages" do
  describe "POST /messages" do
    it "creates a message" do
      post messages_path
      Message.count.should ==1
    end
  end
end
