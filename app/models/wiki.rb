class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :collaborations
  has_many :users, through: :collaborations
  validates :title, presence: true
  validates :body, presence: true

  scope :visible_to, -> (user) { (user.role == 'admin' || user.role == 'premium') ? all : where(private: false) + where(user_id: user.id) }
end
