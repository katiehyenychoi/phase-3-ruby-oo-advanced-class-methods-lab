require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
    #Question- is it the @@all or the self.all?
  end
 
  def self.create 
   new_song=self.new
   #new_song=Song.new
   #why doesnt self.class.new work ?
   new_song.save
   new_song
  #  binding.pry
  end

  def self.new_by_name(songname)
  new_song = self.new
  # new_song = Song.new  #same thing
  new_song.name =songname
  new_song
  end

  def self.create_by_name(songname) 
    new_song =self.create
    new_song.name=songname
    new_song
    #below also works
    # new_song = self.new
    # new_song.name =songname
    # new_song.save
    # new_song
   end

  def self.find_by_name(songname)
  self.all.find do |song|
    song.name == songname
  end
  end

  def self.find_or_create_by_name(songname)
  self.find_by_name(songname) ||  self.create_by_name(songname)
  # if self.find_by_name(songname).length > 0
  #  then nil 
  #  else self.create_by_name(songname)
  #  end
  end

  def self.alphabetical
    #  binding.pry
  self.all.sort_by{ |song| song.name}
  end

  def self.new_from_filename(filename)
  new_song = self.new
  new_song.artist_name = filename.split(' - ')[0]
  new_song.name = filename.split(' - ')[1].chomp(".mp3")
  #  binding.pry
  new_song
  end

  def self.create_from_filename(filename)
    #does this work too?
   new_song = self.new_from_filename(filename)
   new_song.save
  #  new_song #no need to return here

  #soln
# new_song = self.create
# new_song.artist_name = filename.split(' - ')[0]
# new_song.name = filename.split(' - ')[1].chomp(".mp3")
# new_song
end


def self.destroy_all
@@all = []
end

end
#  binding.pry