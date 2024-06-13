class User < ApplicationRecord
  has_many :posts, dependent: :destroy # ユーザーが削除されたら投稿も一緒に削除
  has_many :shares # ユーザーがシェアした投稿
  has_many :shared_posts, through: :shares, source: :post # ユーザーがシェアした投稿の一覧
  authenticates_with_sorcery! # sorcery で認証機能を使う
  validates :password, length: { minimum: 4 }, if: -> { new_record? || changes[:crypted_password] } 
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] } 
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] } 
  validates :first_name, presence: true, length: { maximum: 255 }
  validates :last_name, presence: true, length: { maximum: 255 }
  validates :email, presence: true, uniqueness: true
  
  def sharing?(post)
    shares.exists?(post_id: post.id)
  end
  def share(post)
    shares.create(post_id: post.id) unless sharing?(post)
  end

  def unshare(post)
    shares.find_by(post_id: post.id)&.destroy
  end
end
