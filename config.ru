require "sinatra"
require "sinatra/reloader" if development?
require "pg"
require_relative "./controllers/meme_controller.rb"
require_relative "./models/Memes.rb"

use Rack::MethodOverride

run MemeController