class TestChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak
    ActionCable.server.broadcast 'some_channel', 'hello world'
  end
end
