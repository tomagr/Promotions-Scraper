class Entry < ApplicationRecord

  validates :title, presence: true
  validates :site_id, uniqueness: true

end
