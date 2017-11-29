class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true
  has_many :notes, dependent: :destroy
  has_many :likes, through: :notes

  # following others
  has_many :active_relationships, foreign_key: :followee_id, class_name: 'Relationship', dependent: :destroy
  has_many :leaders, through: :active_relationships

  # being followed
  has_many :passive_relationships, foreign_key: :leader_id, class_name: 'Relationship', dependent: :destroy
  has_many :followees, through: :passive_relationships

  def following?(leaders)
    self.leaders.include?(leaders)
  end

  def follow!(leader)
    leaders << leader if leader != self && !following?(leader)
  end

  def unfollow(leader)
    leaders.destroy(leader)
  end

end
