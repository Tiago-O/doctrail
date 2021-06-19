class Userdoc < ApplicationRecord
  belongs_to :doc
  belongs_to :user

  validates :owner, inclusion: [true, false]

  def self.zero_happy?(userdocs)
    return false if userdocs.empty?

    userdocs.where(happy: false).count.zero? # they are all happy
  end
end
