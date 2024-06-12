class Post < ApplicationRecord
  validates :radio_name, :content, presence: true # radio_name, content は必須
  has_many :votes, dependent: :destroy # 投票は投稿が削除されたら一緒に削除
  belongs_to :user, optional: true # 投稿はユーザーに紐づくが、ユーザーが削除されても投稿は残す
end
