class User < ApplicationRecord
  has_many :orders, dependent: :restrict_with_error
  has_many :credits, dependent: :restrict_with_error

  scope :active, -> { where(active: true) }
end
