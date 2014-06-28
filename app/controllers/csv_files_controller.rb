class CsvFilesController < ApplicationController
	skip_before_action :verify_authenticity_token
  def index
  	@user = User.new
  	@tag = Tag.new
  	@user_tag = UserTag.new
  end

  def input
		csv_file = params[:file].open
		require 'csv'
		# Create and array of key-value pairs where the keys are determined by first row.
		CSV.foreach(csv_file, :headers => true, :col_sep => ',') do |row|
			# Create or retrieve the user
			@user = User.find_or_create_by(name: row[0], email: row[1])
			for i in 2..row.size
				# Create the tags and userTags
			 	@tag = Tag.find_or_create_by(name: row[i])
			 	UserTag.find_or_create_by(tag_id: @tag.id, user_id: @user.id)
			end
		end 
		# Note: I use find_or_create_by to allow for line 20 to run if the
		#       User / Tag already exists. For example: The last row of given csv.txt 
		#       - I also use it to revent duplicate records.
		render :nothing => true
  end

  def display
  	@users = User.all
  	@tags = Tag.all
  	@userTags = UserTag.all
  	render :display
  end
end
