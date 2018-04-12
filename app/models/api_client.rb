class ApiClient < ApplicationRecord
  scope :active, -> { where(active: true) }
end
