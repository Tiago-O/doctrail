class Userdoc < ApplicationRecord
  belongs_to :doc
  belongs_to :user

  validates :owner, inclusion: [true, false]
end
