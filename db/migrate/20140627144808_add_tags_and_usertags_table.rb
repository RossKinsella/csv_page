class AddTagsAndUsertagsTable < ActiveRecord::Migration
  def change
  	create_table :tags do |t|
  		t.string :name

  	end

  	create_table :user_tags do |t|
  		t.integer :tag_id
  		t.integer :user_id 

  	end
  end
end
