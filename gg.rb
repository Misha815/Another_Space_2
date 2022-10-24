require 'gosu'

class GG < Gosu::Window
attr_accessor :an_integer
def initialize width =  480, height = 580
super 
 @menu = Gosu::Image.new ("ggg.png")
  @x, @y = 0, 0 
@song        = Gosu::Song.new("death.mp3")
 @song.play(true)
end

def draw
@menu.draw(@x, @y, 0)
end

def update
end

def button_down(id)
case id
when Gosu:: KB_RETURN
load 'main.rb'
when Gosu:: KB_ESCAPE
load 'menu.rb'
end
end

def needs_cursor?
    true
  end
end

GG.new.show
