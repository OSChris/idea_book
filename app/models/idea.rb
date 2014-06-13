class Idea < ActiveRecord::Base

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  belongs_to :user

  has_many :comments, dependent: :destroy

  has_many :members, dependent: :destroy
  has_many :member_users, through: :members, source: :user

  has_many :likes, dependent: :destroy
  has_many :users_that_like, through: :likes, source: :user

  validates :title, :body, presence: true

  self.per_page = 10

  def joined_by?(user)
    members.exists?(user: user)
  end

  def liked_by?(user)
    likes.exists?(user: user)
  end

end
