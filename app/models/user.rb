class User < ApplicationRecord
  has_secure_password
  has_many :events
  has_many :user_events
  has_many :attended_events, through: :user_events, source: :event
  has_many :messages

end
