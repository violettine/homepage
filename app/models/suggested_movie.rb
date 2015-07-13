class SuggestedMovie < ActiveRecord::Base
  validates :link, presence: true
  validates :title, presence: true
end
