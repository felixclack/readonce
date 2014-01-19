require 'spec_helper'

describe Message do
  it { should validate_presence_of :body }
  it { should belong_to :sender }
end
