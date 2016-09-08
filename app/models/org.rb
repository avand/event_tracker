class Org < ApplicationRecord

  has_many :events, dependent: :destroy

end
