class AnnouncementController < ApplicationController
	# index method gets called when the announcement URL is requested.
	# index method gets mapped to the announcement index.html.erb.
	def index
		# call all method on Announcement model class.
		# all method selects all of the data in the announcement table
		# and returns the data as an array of obejcts.
		# store the array of objects in an instance variable.
		# instance variable is available to announcement index.html.erb.
		@announcement = Announcement2.all
	end
	# new method gets called when the announcement/new URL is requested.
	# new method is mapped to the announcement new.html.erb
	def new
	end

	def create
		# call constructor of Announcement model class giving it the
		# first name and last name paramters input in the actors
		# new.html.erb
		# constructo creates Announcement model object which is stored
		# in variable
		announcement = Announcement2.new(announcement_params)
		# call save method on Announcement object
		# save method inserts the data in the Announcement model object
		# into the actor table
		if announcement.save
			# if the save method succeeds, request the announcement URL
			# which will rendor the announcement index.html.erb in the browser
			redirect_to "/announcement"
		else
			# get full messages associated with errors
			# store them in a Rails flash object named errors so that
			# the full messages may be displayed in the announcement new.html.erb
			flash[:errors] = announcement.errors.full_messages
			# if the save method fails, request the announcement/new URL
			# which will rendor the announcement new.html.erb in the browser
			redirect_to "/announcement/new" 
		end
	end
	# edit method gets called when the announcement/:id/edit URL is requested
	# edit method is mapped to the announcement edit.html.erb
	def edit
		# call find method on Announcement model class giving it the id sent
		# in the request 
		# the find method selects all of the data in the actor table where
		# the id is equal to the id sent in the request
		# the selected data will be returned as an object 
		# the object will be stored in an instance variable will be 
		# available to the edit.html.erb
		@announcement = Announcement2.find(params[:id])
	end
	# show method gets called when the announcement/:id URL is requested
	# show method is mapped to the announcement show.html.erb
	def show
		# call find method on Announcement model class giving it the id sent
		# in the request
		# find method selects all of the data in the announcement table where
		# the id is equal to the id sent in the request 
		# selected data will be returned in an array of movie objects 
		# store the array of movie objects in an instance variable
		# instance variable is availble to actors show.html.erb
		@anouncement= Announcement2.find(params[:id]).announcement
	end

	# update method gets called when the Update button is pushed on the
	# announcement edit.html.erb
	def update
		# call find method on Announcement model class giving it the id sent in the
		# request
		# find method selects all of the data in the announcement table where
		# the id is equal to the id sent in the request
		# the selected data will be returned as an object
		# the object will be stored in a variable
		announcement = Announcement2.find(params[:id])
		# call update method on Announcement object giving the title and
		# body parameters input in the actors edit.html.erb
		# update method updates the data in the announcement table use the parameters
		if announcement.update(announcement_params)
			# if the update method succeeds, request the announcement URL which
			# will render the announcement index.html.erb in the browser
			redirect_to "/announcement"
		else
			# if the update method fails, get the full messages associated
			# with the errors
			# store them in a Rails flash object named errors so that
			# the full messages may be displayed in the requested URL
			flash[:errors] = announcement.errors.full_messages
			# request the actors/:id/edit URL which will render the actors
			# edit.html.erb
			redirect_to "/announcement/#{announcement.id}/edit"
		end
	end

	# delete method gets called when the announcement/:id/delete URL is requested
	# delete method is mapped to the announcement delete.html.erb
	def delete
		# call find method on Announcement model class giving it the id sent
		# in the request 
		# the find method selects all of the data in the announcement table where
		# the id is equal to the id sent in the request
		# the selected data will be returned as an object 
		# the object will be stored in an instance variable will be 
		# available to the delete.html.erb
		@announcement = Announcement2.find(params[:id])
	end

	# destory method gets called when the Delete button is pushed on the 
	# announcement delete.html.erb
	def destroy
		announcement = Announcement2.find(params[:id])
		announcement.destroy
		redirect_to "/announcement"
	end

	def announcement_params
		# params is a Rails object that gets the specified request
		# paramters
		params.require(:announcement).permit(:title, :body)
	end
end
