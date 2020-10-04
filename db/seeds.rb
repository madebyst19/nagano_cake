# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
    email: 'test1@test.com',
    password: 'naganocake'
)
Genre.create!(
    name: "",
    is_active: true
)
Item.create!(
    name:"シフォンケーキ",
    introduction: '美味しい',
   image_id: "cake.jpg",
    genre_id: 1,
    price: 150,
    is_active: true
)
    
    Item.create!(
        name:"プリン",
        introduction: '滑らか',
       image_id: "cake2.jpg",
        genre_id: 1,
        price: 120,
        is_active: true
)

Customer.create!(
   last_name: "太平",
    first_name: "田中",
    last_name_kana: "タイヘイ",
    first_name_kana: "タナカ",
    email: "aa@gmail.com",
    password: "aaaaa998",
    postal_code: "333-4444",
    telephone_number: "090-000-0000",
    is_deleted: true
)
CartItem.create!(
    item_id: 1,
    customer_id: 1,
    amount: 3
   )
Order.create!(
    postal_code:"111-2222",
    customer_id:1,
    address: "東京",
    name:"山田",
    payment_method: 1,
    shipping_cost:1000,
    total_payment:5000,
    status: 1
)
OrderDetail.create!(
    order_id: 1,
    item_id: 1,
    price: 200,
    amount:2,
    making_status:3
)
Address.create!(
    customer_id:1,
    name:"田中",
    postal_code:"213-0944",
    address:"横浜"
)