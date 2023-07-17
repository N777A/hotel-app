class Room < ApplicationRecord
    belongs_to :user
    has_one_attached :image
    validates :name, presence: true
    validates :intro, presence: true
    validates :address, presence: true
    validates :fee, presence: true

    def self.ransackable_attributes(auth_object = nil)
        ["address", "name"]
    end
end
