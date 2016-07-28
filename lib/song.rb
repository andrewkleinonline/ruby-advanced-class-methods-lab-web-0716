require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    self.all << song
    song
  end

  def self.new_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end
  

  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name
    self.all << song
    song
  end

  def self.find_by_name(song_name)
    self.all.detect do |song|
      song.name == song_name
    end
  end

  def self.find_or_create_by_name(song_name)
    #binding.pry
    if self.find_by_name(song_name)
      self.find_by_name(song_name)
    else
      self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name }
  end

  def self.new_from_filename(filename)
    split_file = filename.split("-")
    artist_name = split_file[0].strip
    song_title = split_file[1].strip
    song_title = song_title[0..song_title.length-5]
    song = self.new_by_name(song_title)
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    split_file = filename.split("-")
    artist_name = split_file[0].strip
    song_title = split_file[1].strip
    song_title = song_title[0..song_title.length-5]
    song = self.create_by_name(song_title)
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    self.all.clear
  end

end

#binding.pry
