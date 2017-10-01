class VideoController < Sinatra::Base

	configure :development do 
		register Sinatra::Reloader
	end

	#Sets location of root directory
	set :root, File.join(File.dirname(__FILE__), "..")

	#Sets location of views
	set :views, Proc.new { File.join(root, 'views') }

	get '/videos' do
		@page_header = "All meme videos"
		@memes = Video.all
		erb :"videos/index"
	end	

	get '/videos/new' do
		erb :"videos/new"
	end

	get '/videos/:id' do
		id = params[:id].to_i
		@meme = Video.find id
		erb :"videos/show"
	end

	post "/videos" do
		new_meme = Video.new
		new_meme.title = params[:title]
		new_meme.description = params[:description]
		new_meme.url = params[:url]
		new_meme.genre = params[:genre]
		new_meme.save
		redirect "/videos"
	end

	get '/videos/:id/edit' do
		@meme = Video.find(params[:id])
		erb :"videos/edit"
	end

	put "/videos/:id" do
		meme = Video.find(params[:id])
		meme.title = params[:title]
		meme.description = params[:description]
		meme.url = params[:url]
		meme.genre = params[:genre]
		meme.save
		redirect "/videos/#{meme.id}"
	end

	delete "/videos/:id" do
		Video.destroy(params[:id])
		redirect "/videos"
	end

end