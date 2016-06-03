class AddIndexToInstagrammersEmail < ActiveRecord::Migration[5.0]
  def change
  	add_index :instagrammers, :email
  end
end
