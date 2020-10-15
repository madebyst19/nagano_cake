class Order < ApplicationRecord
    belongs_to :customer
    has_many :order_details, dependent: :destroy
    enum status: ["制作中","制作完了","発送準備","発送済み"]
end
