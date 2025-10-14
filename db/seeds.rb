# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# ユーザーのシードデータ
puts "Creating users..."

user1 = User.find_or_create_by!(email: "user1@example.com") do |user|
  user.name = "田中太郎"
  user.password = "development_password"
  user.password_confirmation = "development_password"
end

user2 = User.find_or_create_by!(email: "user2@example.com") do |user|
  user.name = "佐藤花子"
  user.password = "development_password"
  user.password_confirmation = "development_password"
end

user3 = User.find_or_create_by!(email: "user3@example.com") do |user|
  user.name = "鈴木一郎"
  user.password = "development_password"
  user.password_confirmation = "development_password"
end

puts "Users created successfully!"

# 読書記録のシードデータ
puts "Creating reading records..."

# 田中太郎の読書記録
ReadingRecord.find_or_create_by!(user: user1, title: "Ruby on Rails ガイド", author: "David Heinemeier Hansson") do |record|
  record.finished_on = Date.current - 30.days
  record.public = true  # 公開
end

ReadingRecord.find_or_create_by!(user: user1, title: "プロを目指す人のためのTypeScript入門", author: "鈴木 拓也") do |record|
  record.finished_on = Date.current - 15.days
  record.public = true  # 公開
end

ReadingRecord.find_or_create_by!(user: user1, title: "リーダブルコード", author: "Dustin Boswell") do |record|
  record.finished_on = Date.current - 7.days
  record.public = false  # 非公開
end

# 佐藤花子の読書記録
ReadingRecord.find_or_create_by!(user: user2, title: "Clean Code", author: "Robert C. Martin") do |record|
  record.finished_on = Date.current - 45.days
  record.public = true  # 公開
end

ReadingRecord.find_or_create_by!(user: user2, title: "デザインパターン", author: "Erich Gamma") do |record|
  record.finished_on = Date.current - 20.days
  record.public = false  # 非公開
end

ReadingRecord.find_or_create_by!(user: user2, title: "アジャイルサムライ", author: "Jonathan Rasmusson") do |record|
  record.finished_on = Date.current - 5.days
  record.public = true  # 公開
end

# 鈴木一郎の読書記録
ReadingRecord.find_or_create_by!(user: user3, title: "パーフェクトRuby", author: "Rubyサポーターズ") do |record|
  record.finished_on = Date.current - 60.days
  record.public = true  # 公開
end

ReadingRecord.find_or_create_by!(user: user3, title: "SQL実践入門", author: "ミック") do |record|
  record.finished_on = Date.current - 25.days
  record.public = false  # 非公開
end

ReadingRecord.find_or_create_by!(user: user3, title: "Git実践入門", author: "濱野 純") do |record|
  record.finished_on = Date.current - 10.days
  record.public = true  # 公開
end

puts "Reading records created successfully!"

# バリデーションテスト用のデータ（コメントアウト）
# 以下のデータはバリデーションエラーが発生するため、テスト時のみコメントを外して使用

# # 未来日のテスト（エラーになるはず）
# puts "Testing future date validation..."
# begin
#   ReadingRecord.create!(
#     user: user1,
#     title: "未来の本",
#     author: "未来の著者",
#     finished_on: Date.current + 1.day
#   )
# rescue => e
#   puts "Future date validation works: #{e.message}"
# end

# # 重複登録のテスト（エラーになるはず）
# puts "Testing duplicate record validation..."
# begin
#   ReadingRecord.create!(
#     user: user1,
#     title: "Ruby on Rails ガイド",
#     author: "David Heinemeier Hansson",
#     finished_on: Date.current - 1.day
#   )
# rescue => e
#   puts "Duplicate record validation works: #{e.message}"
# end

puts "Seed data creation completed!"
puts "Total users: #{User.count}"
puts "Total reading records: #{ReadingRecord.count}"
