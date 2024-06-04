class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :radio_name
      t.text :content

      t.timestamps
    end
  end
end
