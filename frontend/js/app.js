import React from 'react'
import ReactDOM from 'react-dom'

import TweetCounter from './components/TweetCounter'
import LanguageCharts from './components/LanguageCharts'

ReactDOM.render(<TweetCounter />, document.getElementById('tweet-counter'))
const languageChartContainer = document.getElementById('language-charts')
languageChartContainer && ReactDOM.render(<LanguageCharts />, languageChartContainer)
