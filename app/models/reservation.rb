class Reservation < ApplicationRecord
    belongs_to :room
    belongs_to :user

    validates :checkin, presence: {message: "チェックインが入力されていません"}, on: :before_confirm
    validates :checkout, presence: {message: "チェックアウトが入力されていません"}, on: :before_confirm
    validates :count_ppl, presence: {message: "人数が入力されていません"}, on: :before_confirm
    validate :in_out_check, on: :before_confirm
    def in_out_check
        unless checkout.nil? || checkin.nil?
            if checkout  < checkin
                errors.add :base, message: 'チェックアウトはチェックイン以降の日付にしてください'
            end
        end
    end
end
