# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# shitatsudzumi 画面遷移図

<a href="https://gyazo.com/bfc39383323b8eec3cae6c1af9e9f578"><img src="https://i.gyazo.com/bfc39383323b8eec3cae6c1af9e9f578.png" alt="Image from Gyazo" width="451"/></a>

# shitatsudzumi ER図

<a href="https://gyazo.com/303a0791ecf6f34c092b7dcd043c74d6"><img src="https://i.gyazo.com/303a0791ecf6f34c092b7dcd043c74d6.png" alt="Image from Gyazo" width="794"/></a>

# shitatsudzumi DB設計

### Usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|encrypted_password|string|null: false|
|lastname|string|null: false|
|firstname|string|null: false|
|lastname_reading|string|null: false|
|firstname_reading|string|null: false|
|birthday|date|null: false|
### Association
- has_many: recipes
- has_many: schedule

### Recipesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|chach_copy|text|null: false|
|material_id|references|null: false, foreign_key: true|
|howtomake_id|references|null: false, foreign_key: true|
|point|text|null: false|
|upbringing|text|null: false|
|many|integer|null: false|
|price|integer|null: false|
|user|references|null: false, foreign_key: true|
### Association
- belongs_to: user
- has_many: materials
- has_many: howtomakes

### Schedulesテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|recipe|references|null: false, foreign_key: true|
### Association
- belongs_to: user
- has_many: recipes

### Materialsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|quantity|string|null: false|
|price|integer|null: false|
|recipe|references|null: false, foreign_key: true|
### Association
- belongs_to: recipe

### HowToMakesテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|image|references|null: false, foreign_key: true|
|recipe|references|null: false, foreign_key: true|
### Association
- belongs_to: recipe
- has_one: image

### Imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|howtomake|references|null: false, foreign_key: true|
### Association
- belongs_to: howtomake