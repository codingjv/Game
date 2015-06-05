require 'gosu'
require './kayak'
require './rock'

class Game < Gosu::Window
  WIDTH = 600
  HEIGHT = 320
  def initialize
    super WIDTH, HEIGHT
    @background = Gosu::Image.new("images/whitewater.jpg", :tileable => true)
    @kayak = Kayak.new
 #   @rock = Rock.new
    self.caption = "S.I./Gosu Tutorial Game"
    @rock_spawn_rate = 0.02
    @rocks = []
#    @star_anim = Gosu::Image::load_tiles("images/star.gif", 25, 25)
#    @stars = Array.new
    @collision_sound = Gosu::Sample.new "images/beep.wav"
    @collision_sound_timer = 0
    @sound_cooldown_time = 100

  end

  def update
    if @collision_sound_timer > 0
      @collision_sound_timer -= 1
#    else
#      collision_sound_timer = 0
    end
    if rand < @rock_spawn_rate
      @rocks << Rock.new
    end
#    puts @rocks.size

  	@kayak.update
  #	@rock.update
    @rocks.each do |rock|
#      if rock.y > HEIGHT
        rock.update
        if collision?(rock, @kayak) && @collision_sound_timer == 0
#          puts "collision!"
          @collision_sound.play
          @collision_sound_timer = @sound_cooldown_time
        end

        if rock.is_off_screen?
        @rocks.delete(rock)
        end
    end
#      rock.update
  end

#    if rand(100) < 4 and @stars.size < 25 then
#      @stars.push(Star.new(@star_anim))



  def draw
  	@background.draw(0,0,-1,1.5,1.5)
  	@kayak.draw
#  	@rock.draw
    @rocks.each do |rock|
        rock.draw
    end
#    @stars.each { |star| star.draw }

  end


  def collision? rock, kayak
    rock.center_x > kayak.x1 && 
    rock.center_x < kayak.x2 && 
    rock.center_y > kayak.y1 && 
    rock.center_y < kayak.y2
  end

end


window = Game.new
window.show

