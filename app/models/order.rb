class Order < ApplicationRecord
    belongs_to :customer
    has_many :order_details, dependent: :destroy
    enum payment_method: ["クレジット","銀行振込"]
    enum status: ["入金待ち","入金完了","製作中","発送準備中","発送済み"]
    validates :name, presence: true,
    length: { minimum: 1,maximum: 50}
    validates :postal_code, presence: true,
    length: { minimum: 1,maximum: 200}
    validates :address, presence: true,
    length: { minimum: 1,maximum: 200}
end
