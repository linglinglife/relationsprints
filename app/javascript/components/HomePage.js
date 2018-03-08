import React, {Component} from 'react';
import { Link } from 'react-router-dom';
import axios from 'axios';
import Modal from 'react-modal';

// Modal.setAppElement('#app');

const customStyles = {
  content : {
    top                   : '50%',
    left                  : '50%',
    right                 : 'auto',
    bottom                : 'auto',
    marginRight           : '-50%',
    transform             : 'translate(-50%, -50%)'
  }
};

import CardList from '../components/CardList';

export default class HomePage extends Component {

  componentWillMount(){

    axios.get('/cards')
    .then( results => this.setState({ sentiments: results.data }) );
  }

  constructor( props ){
    super( props );

    this.state = {
      sentiments: null,
      modalIsOpen: false,
      incident: '',
      feeling: '',
      expectation: '',
      importance: ''
    };

    this.openModal = this.openModal.bind(this);
    this.afterOpenModal = this.afterOpenModal.bind(this);
    this.closeModal = this.closeModal.bind(this);
    this.submitCard = this.submitCard.bind(this);
    this.handleChange = this.handleChange.bind(this);
  }

  openModal(sentiment) {
    this.setState({ modalIsOpen: sentiment });
  }

  afterOpenModal() {
   // references are now sync'd and can be accessed.
    // this.subtitle.style.color = red;
  }

  closeModal() {
    this.setState({modalIsOpen: false});
  }

  submitCard(e) {

    e.preventDefault();

    axios.post('/cards', {
      sentiment: this.state.modalIsOpen,
      incident: this.state.incident,
      feeling: this.state.feeling,
      expectation: this.state.expectation,
      importance: this.state.importance
    })
    .then( response => {
      // create a deep copy of this state object
      let sentiments = {...this.state.sentiments}; //Object.assign({}, this.state.sentiments );

      if( !sentiments[response.data.sentiment] ){
        // initialize this list of cards to be an empty array if it doesn't exist yet
        sentiments[response.data.sentiment] = [];
      }

      // set response data to be the top of the list of cards for the set sentiment
      sentiments[response.data.sentiment].push( response.data );

      this.setState({ sentiments });
    })
    .catch( err => console.log(err) );
    console.log(e);
  }

  handleChange(e) {
    this.setState({[e.target.name]: e.target.value});
  }

  render() {

    if (!this.state.sentiments){
      return <div>Loading...</div>;
    }

    const cards = Object.keys(this.state.sentiments).map( key => {
      return <CardList
        sentiment={key}
        cards={this.state.sentiments[key]}
        key={key}
        onaddclick={ this.openModal }
      />;
    });

    return (
      <div className="container">
        <div>
          {cards}
        </div>
        <div>
          <Modal
            isOpen={this.state.modalIsOpen}
            onAfterOpen={this.afterOpenModal}
            onRequestClose={this.closeModal}
            appElement={document.getElementById('app')}
            style={customStyles}
            contentLabel="New Card"
          >

            {/* <h2 ref={subtitle => this.subtitle = subtitle}>Hello</h2> */}
            <div className="questions form-group">Log a new <strong>{ this.state.modalIsOpen }</strong> card</div>
            <form onSubmit={this.submitCard}>
              <h3>What happened?</h3>
              <input type="textarea" name="incident" className="form-control" idName="exampleFormControlTextarea1" onChange={ this.handleChange } />
              <h3>How do you feel about it?</h3>
              <input type="textarea" name="feeling" className="form-control" onChange={ this.handleChange }/>
              <h3>What was your expectation?</h3>
              <input type="textarea" name="expectation" className="form-control" onChange={ this.handleChange }/>
              <h3>How important is it to you?</h3>
              <input type="number" name="importance" className="form-control" onChange={ this.handleChange }/>
              <input type="submit" value="Submit" />
            </form>
            <button onClick={this.closeModal}>Close</button>

          </Modal>
        </div>
      </div>


    );
  }
}
