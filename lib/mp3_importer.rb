# MP3Importer
#   #initialize
#     accepts a file path to parse mp3 files from 
#   #files
#     loads all the mp3 files in the path directory 
#     normalizes the filename to just the mp3 filename with no path 
#   #import
#     imports the files into the library by creating songs from a filename 

class MP3Importer
 
  attr_accessor :path 
  
 def initialize(filepath)
   @path = filepath
  
 end
 
 def files
   @files = Dir.entries(@path)
   @files.delete_if {|file| file == "." || file == ".."}
 end 

 def import 
    files.each do |file|
    parts = file.split(" - ")
    artist_name = parts[0]
    song_name = parts[1]
   
    a = Artist.find_or_create_by_name(artist_name)
    a.add_song(Song.new(song_name))
  end 
 end 

end 