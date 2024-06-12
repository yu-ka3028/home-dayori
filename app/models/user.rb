class User < ApplicationRecord
  has_many :posts, dependent: :destroy # ユーザーが削除されたら投稿も一緒に削除
  authenticates_with_sorcery! # sorcery で認証機能を使う
  validates :password, length: { minimum: 4 }, if: -> { new_record? || changes[:crypted_password] } 
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] } 
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] } 
  validates :first_name, presence: true, length: { maximum: 255 }
  validates :last_name, presence: true, length: { maximum: 255 }
  validates :email, presence: true, uniqueness: true
end
