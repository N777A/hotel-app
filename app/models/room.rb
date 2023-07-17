class Room < ApplicationRecord
    belongs_to :user
    has_one_attached :image
    validates :name, presence: true
    validates :intro, presence: true
    validates :address, presence: true
    validates :fee, presence: true
end
