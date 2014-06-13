class Idea < ActiveRecord::Base

  belongs_to :user

  has_many :comments, dependent: :destroy

  has_many :members, dependent: :destroy
  has_many :member_users, through: :members, source: :user

  validates :title, :body, presence: true

  def joined_by?(user)
    members.exists?(user: user)
  end


end
