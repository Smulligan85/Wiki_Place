class Wiki < ActiveRecord::Base

  validates :title, presence: true;
  validates :body, length: { minimum: 10 }
  belongs_to :user
end
