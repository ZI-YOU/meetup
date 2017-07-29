class AddCommentsCountToMeetup < ActiveRecord::Migration[5.0]
  def change
  	add_column :meetups, :comments_count, :integer, :default => 0
  end
end
