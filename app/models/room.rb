class Room < ApplicationRecord
    belongs_to :user
    has_many :reservations
    has_one_attached :image

    validates :name, presence: true
    validates :intro, presence: true
    validates :address, presence: true
    validates :fee, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}

    #ransack 設定
    def self.ransackable_attributes(auth_object = nil)
        ["address", "name", "intro"]
    end
    def self.ransackable_associations(auth_object = nil)
        []
    end
end
