#   The MP3Importer class will parse all the filenames in the spec/fixtures folder and send the filenames to the Song class
# # The Song class will be responsible for creating songs given each filename and sending the artist's name (a string) to the Artist class
# # # The Artist class will be responsible for either creating the artist (if the artist doesn't exist in our program yet) or finding the instance of that artist (if the artist does exist   

# MP3Importer relies on Song in order to do its job of parsing filenames. Song relies on the Artist instances to build associations. Therefore, we'll start by working on Artist. Keep in mind though, that you will need to be build out related classes together in order to pass some tests, as they work in collaboration.

class Artist 
  
  attr_accessor :name, :songs
  @@all = [] 

  
 def initialize(name)
   @name = name
   @songs = []
   @@all << self 
 end 
 
 def add_song(song)
  @songs << song 
 end 

 def self.all
   @@all 
 end 
 
 def save 
  @@all << self 
 end 
 
 def self.find_or_create_by_name(name)
  self.all.detect {|artist| artist.name == name} || Artist.new(name)
 end 
 
 def print_songs
  @songs.each {|song| puts song.name}
 end 
 
end 


