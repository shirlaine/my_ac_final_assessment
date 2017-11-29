class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:facebook]

  validates :username, presence: true
  has_many :notes, dependent: :destroy
  has_many :likes

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

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      # user.name = auth.info.name   # assuming the user model has a name
      # user.image = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end

end
