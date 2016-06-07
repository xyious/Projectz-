class Project < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  validates :name, presence: true, length: { minimum: 8 }
  validates :description, presence: true, length: { minimum: 16 }
  validates :customer, presence: true
end
