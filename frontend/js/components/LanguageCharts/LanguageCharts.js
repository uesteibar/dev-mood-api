import React, { Component } from 'react'
import {ResponsiveContainer, ScatterChart, Scatter, XAxis, YAxis, CartesianGrid, Tooltip, Legend} from 'recharts'
import LanguageTooltip from './LanguageTooltip'

class LanguageCharts extends Component {
  constructor(props) {
    super(props)
    this.state = { languages: [] }
  }

  componentDidMount() {
    fetch('/api/languages')
      .then(response => response.json())
      .then(data => data.collection)
      .then(languages => {
        return languages.sort((a, b) => {
          return a.occurrences - b.occurrences
        })
      })
      .then(languages => this.setState({languages: languages}))
  }


  renderLines = () => {
    return this.state.languages.map(language => {
      return <Line key={language.id} dataKey={language.name} stroke={this.randomColor()} />
    })
  }

  render() {
    const { languages } = this.state

    return (
      <div>
        <ResponsiveContainer height={500} width="100%" >
          <ScatterChart width={400} height={400} margin={{top: 20, right: 20, bottom: 20, left: 20}}>
          	<XAxis hide={true} dataKey={'occurrences'} name='Occurrences' unit=' tweets'/>
          	<YAxis dataKey={'moodAvg'} name='Mood' unit=' average'/>
          	<Scatter name='A school' data={languages} fill='#8884d8'/>
          	<Tooltip content={<LanguageTooltip />} cursor={true}/>
          </ScatterChart>
        </ResponsiveContainer>
      </div>
    )
  }
}

export default LanguageCharts
