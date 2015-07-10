class ShortMovie < ActiveRecord::Base
  validates :link, presence: true
end
