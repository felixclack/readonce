require 'spec_helper'

describe Message do
  it { should validate_presence_of :body }
  it { should belong_to :sender } #messages belong to sender 
  it { should belong_to :receiver } #messages belong to receiver 
  it { should validate_presence_of :receiver_id } #receiver messages belong to receiver id
end
