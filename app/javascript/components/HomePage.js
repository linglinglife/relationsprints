import React, {Component} from 'react';
import { Link } from 'react-router-dom';
import axios from 'axios';

import CardList from '../components/CardList';

// import CardList from './components/CardList';

export default class HomePage extends Component {

  componentWillMount(){
  axios.get('/cards')
  .then( results => this.setState({ sentiments: results.data }) );
}

  constructor( props ){
    super( props );

    this.state = {
      sentiments: null
    };
  }

  render() {

    if (!this.state.sentiments){
      return <div>Loading...</div>;
    }

    const cards = Object.keys(this.state.sentiments).map( k => {
      return <CardList sentiment={k} cards={this.state.sentiments[k]}/>;
    });

    return (
      <div>
        {cards}
      </div>

    );
  }
}
