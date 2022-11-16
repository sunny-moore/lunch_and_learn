class User < ApplicationRecord
  before_create { self.api_key = secure_key }

  validates_presence_of :name
  validates_presence_of :email
  validates_uniqueness_of :email
  # validates_presence_of :api_key
  has_many :favorites
  
  def secure_key
    SecureRandom.hex(15)
  end
end
