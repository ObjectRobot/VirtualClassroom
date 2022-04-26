# each route consists of 3 parts: 1. HTTP method, 2. URL to web page
# view being requested, 3. name of Ruby class and method envoked when
# URL to web page view is requested.
Rails.application.routes.draw do
  # When a get request is made for the announcement URL,
  # Rails envokes the index method in the actors Ruby controller class.
  # Rails automatically maps the index method to a web page view named
  # index.html.erb and serves the web page to the browser where its
  # rendered.
 get "announcement" => "announcement#index"
 get "announcement/new" => "announcement#new"
  # When a post request is made for the announcement URL,
  # Rails envoked the create method in the announcement Ruby controller class
  post "announcement" => "announcement#create"
  get "announcement/:id/edit"=> "announcement#edit"
  post "announcement/:id" => "announcement#update"
  get "announcement/:id/delete" => "announcement#delete"
  delete "announcement/:id" => "announcement#destroy"
  get "announcement/:id" => "announcement#show"
  get "appearances" => "appearances#index"
  post "appearances" => "appearances#create"
  get "weblink" => "weblink#index"
  get "weblink/new" => "weblink#new"
  post "weblink" => "weblink#create"
  get "weblink/:id/edit" => "weblink#edit"
  post "weblink/:id" => "weblink#update"
  get "weblink/:id/delete" => "weblink#delete"
  delete "weblink/:id/delete" => "weblink#destroy"
  get "weblink/:id" => "weblink#show"
  get "webfile" => "webfile#index"
  get "webfile/new" => "webfile#new"
  post "webfile" => "webfile#create"
  get "webfile/:id/edit" => "webfile#edit"
  post "webfile/:id" => "weblink#update"
  get "webfile/:id/delete" => "webfile#delete"
  delete "webfile/:id/delete" => "webfile#destroy"
  get "webfile/:id" => "webfile#show"  
end
