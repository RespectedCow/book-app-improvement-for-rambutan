require 'bcrypt'

class Organization < ActiveRecord::Base
    belongs_to :user
    has_many :books
    
    validates_presence_of :name, :description

    def authenticate_owner(user)
        self.user = user?
    end

    def authenticate_members(user)
        isMember = false

        self.users.each do |member|
            if member == user
                isMember = true
            end
        end

        return isMember
    end
end