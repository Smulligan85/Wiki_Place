class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :collaborators

  scope :visible_to, -> (user) { (user.role == 'admin' || user.role == 'premium') ? all : where(private: false) }
end
