class AddVotesCountToItems < ActiveRecord::Migration
  def change
    add_column :items, :votes_count, :integer, default: 0
  end
end
