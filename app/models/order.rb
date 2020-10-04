class Order < ApplicationRecord
    belongs_to :customer
    has_many :order_detail, dependent: :destroy
    enum status: { A: 0, B: 1, O: 2, AB: 3 }
end
