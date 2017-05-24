import React, { Component } from 'react'

import socket from '../../socket'

class TweetCounter extends Component {
  constructor(props) {
    super(props)
    this.state = { count: 0 }
  }

  componentDidMount() {
    const channel = socket.join('stats:languages')

    channel.on("update", payload => {
      this.setState({count: payload.total_occurrences})
    })
  }

  render() {
    return (
      <p>Tweets analyzed: <span style={{ fontWeight: 'bold' }}>{ this.state.count }</span></p>
    )
  }
}

export default TweetCounter
