class Level < ApplicationRecord
  validates :priority, uniqueness: true
end
