class Post < ApplicationRecord
  validates :radio_name, :content, presence: true # radio_name, content は必須
end
