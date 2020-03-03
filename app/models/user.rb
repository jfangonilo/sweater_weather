class User < ApplicationRecord
  validates_presence_of :email,
                        :api_key

  validates_uniqueness_of :email
  validates_confirmation_of :password
  has_secure_password
end
