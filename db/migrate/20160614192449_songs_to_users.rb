class SongsToUsers < ActiveRecord::Migration
  def change
    change_table :songs do |t|
      t.belongs_to :member
    end
  end
end
