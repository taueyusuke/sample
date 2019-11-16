class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  belongs_to :facility
  has_many :schedules, dependent: :destroy
  
  before_save { self.email = email.downcase }
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :lastname, presence: true, length: { maximum: 50 }
  validates :firstname, presence: true, length: { maximum: 50 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
end
