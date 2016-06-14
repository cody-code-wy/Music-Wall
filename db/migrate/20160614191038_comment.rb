class Comment < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to :member
      t.belongs_to :song
      t.string :content
      t.timestamps
    end
  end
end
