import {Socket, LongPoller} from "phoenix"

const join = room => {
  let socket = new Socket("/socket", {})
  socket.connect()

  let channel = socket.channel(room, {})

  channel.join()
    .receive("ok", resp => {})
    .receive("error", resp => {})

  return channel
}

export default { join }
