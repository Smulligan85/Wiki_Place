class Wiki < ActiveRecord::Base

  validates :title, presence: true
  validates :body, length: { minimum: 10 }
  validates :user_id, presence: :true
  belongs_to :user

end
