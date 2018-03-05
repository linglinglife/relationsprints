/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

console.log('Hello World from Webpacker')

import React, {Component} from 'react';
import ReactDOM, { render } from 'react-dom';
import { HashRouter as Router, Route } from 'react-router-dom';

import HomePage from '../components/HomePage';


class App extends Component {

  render(){
    return (

      <div>
        <h1>RELATIONSPRINT</h1>
        <Router>
          <Route exact path="/" component={ HomePage } />
          {/* <Route exact path="/" */}
        </Router>

      </div>

    )
  }
}

// if (document.getElementById('app')){
//   console.log('here');
// }
//   const container = document.body.appendChild(document.createElement('div'));
//   render(<App />, container);

document.addEventListener('DOMContentLoaded', () => {
  if (document.getElementById('app')){
    ReactDOM.render(<App/>, document.getElementById('app') );
  }
});
