class UpvoteTimestamps < ActiveRecord::Migration
  def change
    change_table :upvotes do |t|
      t.timestamps
    end
  end
end
