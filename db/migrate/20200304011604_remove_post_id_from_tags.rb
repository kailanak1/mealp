class RemovePostIdFromTags < ActiveRecord::Migration[6.0]
  def change
    remove_column :tags, :post_id
  end
end
