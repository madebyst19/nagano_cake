class OrderDetail < ApplicationRecord
    belongs_to :item
    belongs_to :order
    enum making_status: ["制作中","制作完了","発送準備","発送済み"]
end
