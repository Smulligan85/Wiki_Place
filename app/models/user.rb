class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  

  has_many :wikis, dependent: :destroy
  has_many :collaborations
  has_many :shared_wikis, through: :collaborations, source: :wiki
  
  def admin!
    role = 'admin'
  end

  def admin?
    role == 'admin'
  end

  def premium!
    role = 'premium'
  end

  def premium?
    role == 'premium'
  end

end
