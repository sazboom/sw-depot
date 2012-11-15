# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  password_digest :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :name, :password, :password_confirmation, :current_password
  attr_accessor :current_password
  
  validates :name, presence: true, uniqueness: true
  before_update :current_password_is_correct?
  after_destroy :ensure_an_admin_remains
    
  has_secure_password
  
  private
    def ensure_an_admin_remains
      if User.count.zero?
        raise "Can't delete last user"
      end
    end

    def current_password_is_correct?
      unless authenticate(current_password)
        errors.add(:current_password,"is incorrect")
        false
      end
    end
end
