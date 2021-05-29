class Doc < ApplicationRecord
  has_many :userdocs
  has_many :versions

  validates :title, presence: { message: "Title must be given please" }, uniqueness: true, length: { in: 3..50 }
  validates :text, presence: true
  validates :locked, presence: true
  validates :final, presence: true
end
