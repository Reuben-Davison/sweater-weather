require 'bcrypt'
class User < ApplicationRecord
    validates_uniqueness_of :email
    validates_presence_of :email
    validates_presence_of :password, :password_confirmation
    # validates_presence_of :password_confirmation

    has_secure_password
end
