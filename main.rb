require 'gosu'
require_relative './menu.rb'

module ZOrder
 BACKGROUND, METIORS, PLAYER, UI = *0..3
end
class GameWindow < Gosu::Window
attr_reader :x, :y
def initialize width = 1200, height = 640, fullscrean = false
super 
 @x1, @y1 = 0,0
 @t = 0
 
 @background = Gosu::Image.new("backk.jpg")
 @player = Player.new
 @player.warp(145, 280)

  @metior_anim = Gosu::Image::load_tiles("asteroid.png", 83, 80)
  @metiors = Array.new

  @sorce = Gosu::Font.new(20)
  @song = Gosu::Song.new("ost_space.mp3")
  @song.play(true)
end
def update
@t += 1
@x1 -= 3
  @metiors.reject! { |metior| !metior.update }
  @metiors.push(Metior.new(@metior_anim)) if rand(30) == 0

  @player.move
  @player.collect_metiors(@metiors)
  if Gosu.button_down? Gosu::KbSpace
  @player.turn_up
  end
end

def draw
@sorce.draw("Score: #{@t}", 10, 10, ZOrder::UI, 1.5, 1.5, Gosu::Color::YELLOW)
 @local_x = @x1 % -@background.width

    @background.draw(@local_x, @y1, ZOrder::BACKGROUND)
    @background.draw(@local_x + @background.width, @y1, ZOrder::BACKGROUND) if @local_x < (@background.width - self.width)

 @player.draw
 @metiors.each { |metior| metior.draw }
end
#menu 
def button_down(id)
load './menu.rb'  if id == Gosu::KbEscape
end
end

class Metior
  attr_reader :x, :y

  def initialize(animation)
       @animation = animation
    @x = 1200
    @y = rand * 500
  end

  def draw
    img = @animation[Gosu.milliseconds / 100 % @animation.size];
    img.draw_rot(@x, @y, ZOrder::METIORS, @x , 0.5, 0.5, 1, 1)
  end

  def update
    # Скорость метиоритов
    @x -= 7
    @y < 650
  end

end
class Player
def initialize
 @boom = Gosu::Sample.new("boom1.mp3")
@image = Gosu::Image.new  ('ships.png')
@x = @y = 0.0
end
 def warp(x, y)
    @x, @y = x, y
 end
 def move
    @y += 5 if @y <= 450
 end
  def turn_up
    @y = [@y-10, 50].max
  end

  def draw
    @image.draw(@x - @image.width / 2, @y - @image.height / 2, ZOrder::PLAYER)
  end
     
def collect_metiors(metiors)
    metiors.reject! do |metior|
      if Gosu.distance(@x, @y, metior.x, metior.y) < 75
 
  @boom.play #song boom
  sleep 2
   load 'gg.rb'
        true
      else
        false
      end
    end
end
end

GameWindow.new.show 

