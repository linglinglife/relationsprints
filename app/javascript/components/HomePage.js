import React, {Component} from 'react';
import axios from 'axios';

// import CardList from './components/CardList';

export default class HomePage extends Component {

componentWillMount(){
  axios.get('/cards')
  .then( console.log  );
}

constructor( props ){
    super( props );

    this.state = {
      data: ''
    };
  }

render() {
    return (
      <div>
        <h1>Home</h1>
      </div>

    );
  }
}
