// クライアントサイドの処理

import consumer from "channels/consumer"

const room = consumer.subscriptions.create("RoomChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel

    // return alert(data['message']);

    const messages = document.getElementById('messages');
    messages.insertAdjacentHTML('beforeend', data['message']);
  },

  speak: function (message) {
    return this.perform('speak', { 'message': message });
  }
});

// window.document.onkeydown = function (event) {
//   if (event.key === 'Enter') {
//     room.speak(event.target.value);
//     event.target.value = '';
//     event.preventDefault();
//   }
// }

window.addEventListener("keypress", function (e) {
  if (e.key === 'Enter') {
    room.speak(e.target.value);
    e.target.value = '';
    e.preventDefault();
  }
})