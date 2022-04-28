class WebfileController < ApplicationController
	# index method gets called when the weblink URL is requested.
	# index method gets mapped to the weblink index.html.erb.
	def index
		# call all method on Weblink model class.
		# all method selects all of the data in the weblink table
		# and returns the data as an array of obejcts.
		# store the array of objects in an instance variable.
		# instance variable is available to weblink index.html.erb.
		@webfile= Webfile.all
	end

	# new method gets called when the weblink/new URL is requested.
	# new method is mapped to the weblink  new.html.erb
	def new
	end
	# create method gets called when the Create button is pushed on
	# the weblink new.html.erb.
	def create
		# call constructor of weblink model class giving it the
		# title, duration, rating, and release_date paramters input in the actors
		# new.html.erb
		# constructo creates weblink model object which is stored
		# in variable
		webfile = Webfile.new(webfile_params)
		# call save method on Weblink object
		# save method inserts the data in the Movie model object
		# into the movie table
		if webfile.save
			# if the save method succeeds, request the movies URL
			# which will rendor the movies index.html.erb in the browser
			redirect_to "/webfile"
		else
			# get full messages associated with errors
			# store them in a Rails flash object named errors so that
			# the full messages may be displayed in the weblink new.html.erb
			flash[:errors] = webfile.errors.full_messages
			# if the save method fails, request the weblink/new URL
			# which will rendor the announcement new.html.erb in the browser
			redirect_to "/webfile/new" 
		end
	end

	# show method gets called when the weblink/:id URL is requested
	# show method is mapped to the weblink show.html.erb
	def show
		# call find method on Weblink model class giving it the id sent
		# in the request
		# find method selects all of the data in the movie table where
		# the id is equal to the id sent in the request 
		# selected data will be returned in an array of weblink objects 
		# store the array of actor objects in an instance variable
		# instance variable is availble to weblink show.html.erb
		@webfile = Webfile.find(params[:id])
	end
	# edit method gets called when the movies/:id/edit URL is requested
	# edit method is mapped to the movies edit.html.erb
	def edit
		# call find method on Movies model class giving it the id sent
		# in the request 
		# the find method selects all of the data in the movies table where
		# the id is equal to the id sent in the request
		# the selected data will be returned as an object 
		# the object will be stored in an instance variable will be 
		# available to the edit.html.erb
		@webfile = Webfile.find(params[:id])
	end

	# update method gets called when the Update button is pushed on the
	# weblink edit.html.erb
	def update
		# call find method on Weblink model class giving it the id sent in the
		# request
		# find method selects all of the data in the actor table where
		# the id is equal to the id sent in the request
		# the selected data will be returned as an object
		# the object will be stored in a variable
		webfile = Webfile.find(params[:id])
		# call update method on Actor object giving the first name and
		# last name parameters input in the actors edit.html.erb
		# update method updates the data in the movies table use the parameters
		if webfile.update(webfile_params)
			# if the update method succeeds, request the actors URL which
			# will render the weblink index.html.erb in the browser
			redirect_to "/webfile"
		else
			# if the update method fails, get the full messages associated
			# with the errors
			# store them in a Rails flash object named errors so that
			# the full messages may be displayed in the requested URL
			flash[:errors] = webfile.errors.full_messages
			# request the weblink/:id/edit URL which will render the movies
			# edit.html.erb
			redirect_to "/webfile/#{webfile.id}/edit"
		end
	end
	
	private
	def webfile_params
		# params is a Rails object that gets the specified request
		# paramters
		params.require(:webfile).permit(:title, :image)
	end
end
