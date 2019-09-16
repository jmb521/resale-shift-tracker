class Admin < ActiveRecord::Base
    has_many :resales
    has_secure_password
    validates :username, presence: true
end
