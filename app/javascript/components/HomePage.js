import React, {Component} from 'react';
// import CardList from './components/CardList';

import axios from 'axios';

export default class HomePage extends Component {

componentWillMount(){
  axios.get('/cards')
  .then( console.log  );
}

render() {
    return (
      <div>
        <h1>Home</h1>

      </div>

    );
  }
}
