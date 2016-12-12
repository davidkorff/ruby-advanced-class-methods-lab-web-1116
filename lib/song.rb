class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
    self #returned here instead of putting it in self.create
  end

  def self.create
  	song = self.new #creating a new instance called song
  	song.save #saves the instance by calling on save method
  end

  def self.new_by_name(name)
  	song = self.new(name)
  	song
  end

  def self.create_by_name(name)
	song = self.new(name).save
	song
  end

  def initialize(name = nil)
  	@name = name
  end

  def self.find_by_name(name)
  	self.all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
  	unless @@all.include?(name)
  		song = self.new(name)
  	end
  end

  def self.alphabetical
  	@@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(file_name)
  	song_name = (file_name.split(" - ")[1]).gsub(".mp3","")
  	artist_name = (file_name.split(" - ")[0]).gsub(".mp3","")
  	song = self.new  # initializes the song
  	song.name = song_name # makes the name of the song equal to song_name
  	song.artist_name = artist_name  # makes the name of the artist equal to artist_name
  	song
  end

  def self.create_from_filename(file_name)
  	song = self.new_from_filename(file_name).save
  	song
  end

  def self.destroy_all
  	@@all.clear
  end

end
