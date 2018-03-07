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
      return (
        <div>
          <span>What happened?</span>
          <p>{card.incident}</p>
          <span>How do you feel about it?</span>
          <p>{card.feeling}</p>
          <span>What was your expectation?</span>
          <p>{card.expectation}</p>
          <span>How important is this to you?</span>
          <p>{card.importance}</p>

        </div>
      )
    })

    return (
      <div className="col-md-4">
        <h1>{this.props.sentiment}</h1>
        <div className="cardlist">{info}</div>
      </div>

    );
  }
}
