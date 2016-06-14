class Upvotes < ActiveRecord::Migration
  def change
    create_table :upvotes do |t|
      t.belongs_to :member
      t.belongs_to :song
    end
  end
end
