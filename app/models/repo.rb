class Repo < ApplicationRecord
  has_many :users
  has_many :docs

  validates :owner, presence: true
end
