import React, {Component} from 'react'
import ReactDOM, { render } from 'react-dom'
import { Router, Route, Link } from 'react-router-dom'
import createBrowserHistory from 'history/createBrowserHistory'

import Home from './Home'

const history = createBrowserHistory()

class Root extends Component {
  render(){
    return (
      <Router history={history}>
        <Route exact path="/" component={Home} />
          {/* <Route path="about" component={About} />
          <Route path="inbox" component={Inbox}>
          <Route path="messages/:id" component={Message} />
        </Route> */}
      {/* </Route> */}
      </Router>
  )
  }
}

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <Root />,
    document.getElementById('root')
  )
})
