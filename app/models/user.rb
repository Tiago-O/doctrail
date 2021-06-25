class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :userdocs
  has_many :docs, through: :userdocs
  has_many :versions
  has_many :comments

  has_one_attached :photo

  validates :first_name, presence: true, length: { minimum: 2 }
  validates :last_name, presence: true, length: { minimum: 2 }
  validates :address, presence: true, length: { minimum: 2 }

  def full_name
    self.first_name + " " + self.last_name
  end
end
