# サーバーサイドの処理を実装

class RoomChannel < ApplicationCable::Channel
  def subscribed
    # Action Cableのメソッド：stream_from
    # データの送受信を行う
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    # ActionCable.server.broadcast(
    #   'room_channel',
    #     {message: data['message']}
    # )

    Message.create! content: data['message']
  end
end
