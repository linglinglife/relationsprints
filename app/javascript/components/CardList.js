import React, {Component} from 'react';
import { Link } from 'react-router-dom';
import axios from 'axios';

// import Card from '../components/Card';

export default class CardList extends Component {

  constructor( props ){
      super( props );

      this.state = {
        sentiments: null
      };
    }

  render() {
    return (
      <div>
        <h1>Sentiment</h1>
        <h1>Cards</h1>
      </div>

    );
  }
}
