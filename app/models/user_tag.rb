class UserTag < ActiveRecord::Base

	validates_presence_of :user_id, :tag_id
  
end