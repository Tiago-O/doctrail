class Version < ApplicationRecord
  after_save :send_notification

  has_rich_text :rich_body

  belongs_to :doc
  has_many :comments
  belongs_to :user

  validates :rich_body, presence: true

  def previous_version
    self.doc.versions.where('created_at < ? AND accepted = ?', self.created_at, true).order(created_at: :desc).limit(1).first
  end

  def user_to_be_notified
    self.doc.users.where("user_id !=  ?", self.user.id)
  end

  def send_notification
    notification = CommentNotification.with(version: self)
    notification.deliver(user_to_be_notified)
  end
end
