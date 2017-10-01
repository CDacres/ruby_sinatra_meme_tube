class Video

	attr_accessor :id, :title, :description, :url, :genre

	def self.open_connection
		PGconn.connect( dbname: "meme" )
	end

	#index

	def self.all

		conn = self.open_connection
		sql = "SELECT * FROM meme;"

		results = conn.exec(sql)

		memes = results.map do |record|
			self.hydrate(record)
		end

		memes

	end

	def self.hydrate meme_data

		meme = Video.new
		meme.id = meme_data['id']
		meme.title = meme_data['title']
		meme.description = meme_data['description']
		meme.url = meme_data['url']
		meme.genre = meme_data['genre']

		meme

	end

	#show

	def self.find id

		conn = self.open_connection
		sql = "SELECT * FROM meme WHERE id = #{id}"
		memes = conn.exec(sql)

		memes = self.hydrate memes[0]

		meme

	end

	#create & update

	def save
		conn = Video.open_connection

		if (!self.id)
			sql = "INSERT INTO meme (title, description, url, genre) VALUES ('#{self.title}', '#{self.description}', '#{self.url}', '#{self.genre}')"
		else
			sql = "UPDATE meme SET title = '#{self.title}', description = '#{self.description}', url ='#{self.url}', genre = '#{self.genre}' WHERE id = #{self.id}"
		end

		conn.exec(sql)

	end

	#delete

	def self.destroy id

		conn = self.open_connection
		sql = "DELETE FROM meme WHERE id = #{id}"
		conn.exec(sql)

	end

end