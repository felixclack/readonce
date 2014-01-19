class Message < ActiveRecord::Base
  belongs_to :sender, class_name: 'User'
  
  validates :body, presence: true
end
