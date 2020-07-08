class Blacklist < ApplicationRecord
  validates :user_id, presence: true
end
