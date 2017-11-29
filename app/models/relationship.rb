class Relationship < ApplicationRecord

  belongs_to :leader, class_name: 'User'
  belongs_to :followee, class_name: 'User'

  validates :leader, presence: true

end
