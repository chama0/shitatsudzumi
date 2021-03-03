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