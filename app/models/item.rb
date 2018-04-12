class Item < ApplicationRecord
  has_many :orders, dependent: :restrict_with_error
  scope :active, -> { where(active: true) }
end
