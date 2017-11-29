class Like < ApplicationRecord

  belongs_to :note
  belongs_to :user

  validates :note, presence: true
  validates :user, presence: true

end
