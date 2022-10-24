class Metior
  attr_reader :x, :y
  
  def initialize(animation)
       @animation = animation
    @color = Gosu::Color.new(0xff_000000)
    @color.red = rand(255 - 40) + 40
    @color.green = rand(255 - 40) + 40
    @color.blue = rand(255 - 40) + 40
    @x = 1138
    @y = rand * 800
  end

  def draw  
    img = @animation[Gosu.milliseconds / 100 % @animation.size];
    img.draw_rot(@x, @y, ZOrder::METIORS, @x, 0.5, 0.5, 1, 1, @color, :add)
  end
  
  def update
    # Move towards bottom of screen
    @x -= 3
    # Return false when out of screen (gets deleted then)
    @y < 650
  end

end
