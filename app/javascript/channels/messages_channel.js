import consumer from "channels/consumer"

consumer.subscriptions.create("MessagesChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    var roomId = $("#chat-box").data("room-id");
    this.checkIn(roomId);
    console.log("connected with room id : " + roomId);
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    console.log("Data received : " + data)
    // Called when there's incoming data on the websocket for this channel
    var posts = $(".message-row").length;
    if(posts == 10) {
      $(".message-row").first().remove();
    }
    $("#chat-box").append(data);
    $("#message-field").val('');
  },

  checkIn(roomId) {
    if(roomId) {
      this.perform('checkIn', { room_id: roomId });
    }
    else {
      this.perform('checkOut');
    }
  }
});
