require 'gosu'
require_relative 'player'

class GameWindow < Gosu::Window
  def initialize
    super 640, 480
    self.caption = 'Gosu Tutorial Game'

    @background_image = Gosu::Image.new('media/sky.jpg', tileable: true)

    @player = Player.new
    @player.warp(320, 240)
  end

  def update
    if Gosu.button_down? Gosu::KbLeft || Gosu.button_down?(Gosu::GpLeft)
      @player.turn_left
    end
    if Gosu.button_down? Gosu::KbRight || Gosu.button_down?(Gosu::GpRight)
      @player.turn_right
    end
    if Gosu.button_down? Gosu::KbUp || Gosu.button_down?(Gosu::GpButton0)
      @player.accelerate
    end
    @player.move
  end

  def draw
    @player.draw
    @background_image.draw(0, 0, 0)
  end

  def button_down(id)
    close if id == Gosu::KbEscape
  end
end

window = GameWindow.new
window.show
