import {Socket, LongPoller} from "phoenix"

const join = room => {
  let socket = new Socket("/socket", {
      logger: ((kind, msg, data) => { console.log(`${kind}: ${msg}`, data) }),
    })
  socket.connect()

  let channel = socket.channel(room, {})

  channel.join()
    .receive("ok", resp => { console.log("Joined successfully", resp) })
    .receive("error", resp => { console.log("Unable to join", resp) })

  return channel
}

export default { join }
