module ApplicationCable
  class Channel < ActionCable::Channel::Base
    def onOpen
      puts "=====on Open===="
    end
  end
end
