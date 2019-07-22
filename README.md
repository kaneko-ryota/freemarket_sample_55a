
# users table
|Column|Type|Options|
|------|----|-------|
|name|integer|null:false|
|name_kana|string|null:false|
|nickname|string|null:false|
|email|string|null:false, unique:true|
|birthday|integer|null:false|
|postal_code|string|null:false|
|prefecture|string|null:false|
|city|string|null:false|
|house_number|string|null:false|
|building_name|string|-----|
|phone_number|string|null:false,unique:true|
|profile|text|-------|

# association
- has_many: :products
- has_many: comments
- has_many: liked_products, through: :likes, source: :product
- has_one: credit

* パスワードとメールアドレスはdeviseファイルで編集
--------------------------------------------------------------------

# credits table
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null:false|
|custmer_id|integer|null:false|
|card_id|integer|null:false|

# association
- belongs_to :user

* pay-jpを使用

--------------------------------------------------------------------

# products table
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|explain|text|null:false|
|category_id|string/references|null:false|
|size|string|------|
|item-status|string|null:false|
|brand_id|references|null:false,foreign_key:true|
|burden|string|null:false|
|delivery_method|string|null:false|
|region|string|null:false|
|delivery_date|string|null:false|
|price|integer|null:false|
|trade_status|integer|null:false,defalut: 1|
|saler_id|integer|null:false|
|purchase_id|integer|---------|

# association
- has_many :comments
- belongs_to :user
- has_many :liked_users, through: :likes, source: user
- belongs_to :bland
- belongs_to :category
- has_many :images

* price　modelで数字制限 validates: price, length]{in: 300..9999999}
* trade_status modelでenum trade_status: { 出品中: 1, 出品中止: 2, 取引中: 3, 取引終了: 4}

---------------------------------------------------------------------
# images table
|Column|Type|Options|
|------|----|-------|
|URL|text|null:false|
|product_id|references|null:false,foreign_key:true|

# association
- belongs_to :product

----------------------------------------------------------------------
# blands table
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|

# association
- has_many :products

-----------------------------------------------------------------------
# likes table
|Column|Type|Options|
|------|----|-------|
|user_id|references|null:false,foreign_key: true|
|product_id|references|null,false,foreign_key: true|

# association
- belong_to :user
- belong_to :product

-----------------------------------------------------------------------
# categories table
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|ancestry|string|null:false|

# association
- has_many :ancestry
- has_many :products

* gem "ancestry"を使用
---------------------------------------------------------------------------
# comments table
|Column|Type|Options|
|------|----|-------|
|body|text|--------|
|user_id|references|null:false,foreign_key:true|
|product_id|references|null:false,foreign_key:true|

# association
- belongs_to :user
- belongs_to :product
