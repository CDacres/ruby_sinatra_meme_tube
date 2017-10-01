class MemeController < Sinatra::Base

	configure :development do 
		register Sinatra::Reloader
	end

	#Sets location of root directory
	set :root, File.join(File.dirname(__FILE__), "..")

	#Sets location of views
	set :views, Proc.new { File.join(root, 'views') }

	get '/memes' do
		@page_header = "All meme videos"
		@memes = Meme.all
		erb :"memes/index"
	end	

	get '/memes/new' do
		erb :"memes/new"
	end

	get '/memes/:id' do
		id = params[:id].to_i
		@meme = Meme.find id
		erb :"memes/show"
	end

	post "/memes" do
		new_meme = Meme.new
		new_meme.title = params[:title]
		new_meme.description = params[:description]
		new_meme.url = params[:url]
		new_meme.genre = params[:genre]
		new_meme.save
		redirect "/memes"
	end

	get '/memes/:id/edit' do
		@post = Meme.find(params[:id])
		erb :"memes/edit"
	end

	put "/memes/:id" do
		meme = Meme.find(params[:id])
		meme.title = params[:title]
		meme.description = params[:description]
		meme.url = params[:url]
		meme.genre = params[:genre]
		meme.save
		redirect "/memes/#{meme.id}"
	end

	delete "/memes/:id" do
		Meme.destroy(params[:id])
		redirect "/memes"
	end

end