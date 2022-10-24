require 'gosu'
module ZOrder
  BACKGROUND, MIDDLE, TOP = *0..2
end
class Menu < Gosu::Window 
attr_accessor :x,:y 
	def initialize width =  480, height = 580
		super 
		 @menu = Gosu::Image.new ("Menu.png")
  @x, @y = 0, 0 
  @song        = Gosu::Song.new("ost_menu.mp3")
  @song.play(true)
  @local = [156,156]
	end
	def update
	@coord = Gosu::Image.from_text('building', 20)
		end
	def draw 
@menu.draw(@x, @y, 0)
		@coord.draw(0,0, 0)
	end 
	
	def mouse_over_button(mouse_x, mouse_y)
    if ((mouse_x > 0 && mouse_x < 30) && (mouse_y > 0 && mouse_y < 20))
    elsif ((mouse_x > 30 && mouse_x < 60) && (mouse_y > 0 && mouse_y < 20))
     true
    else
      false
    end
  end

  def button_down(id)
    case id
    when Gosu::MsLeft
      @locs = [mouse_x, mouse_y]
      if mouse_over_button(mouse_x, mouse_y)
        load "main.rb"
        end
    when Gosu::KB_RETURN
      load "main.rb"
     when Gosu::KB_ESCAPE
     abort
          end
    end
  
	def needs_cursor?
    true
  end
end
Menu.new.show

