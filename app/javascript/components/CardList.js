import React, {Component} from 'react';
import { Link } from 'react-router-dom';
import axios from 'axios';

// import Card from '../components/Card';

export default class CardList extends Component {

  constructor( props ){
      super( props );

      this.state = {
        sentiment: null,
        cards: null
      };
    }

  render() {

    const info = this.props.cards.map( card => {
      return <div>
      <li>{card.incident}</li>
      <li>{card.feeling}</li>
      <li>{card.expectation}</li>
      <li>{card.importance}</li>
      </div>
    })

    return (
      <div>
        <h1>{this.props.sentiment}</h1>
        <h1>{info}</h1>
      </div>

    );
  }
}
