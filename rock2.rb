class Rock  #formerly 'Star' class
#  attr_reader :x, :y

  def initialize(image)
  @image = image
  @image = Gosu::Image.new("images/rock.png")
    @x = rand * 600
#    @y = rand * 480
    @y = 0
    @z = 1
    @speed = rand(1..4)
  end

# module ZOrder
#  Background, Stars, Player, UI = *0..3
# end

  def update
      @y += @speed
  end

  def draw  
#    @image.draw(@x,@y,@z)
    img = @image[Gosu::milliseconds / 100 % @animation.size];
    img.draw(@x - img.width / 2.0, @y, @z) #, 1, 1, @color, :add)
  end
end
