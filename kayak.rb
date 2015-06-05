class Kayak 
  def initialize
    @image = Gosu::Image.new("images/kayak-128.png")
    @width = @image.width    
    @height = @image.height
    @x = Game::WIDTH/2 - @width/2
    @y = Game::HEIGHT-@height
    @z = 1
    @speed = 4
  end


  def update
    if Gosu::button_down? Gosu::KbLeft
      #move kayak left
      @x -= @speed
    elsif Gosu::button_down? Gosu::KbRight 
      #move kayak right
      @x += @speed
    end
  end

  def draw
  	@image.draw(@x,@y,@z)
  end

  def x1
    @x
  end

  def x2
    @x + @width
  end

  def y1
    @y
  end

  def y2
    @y + @height
  end

end
