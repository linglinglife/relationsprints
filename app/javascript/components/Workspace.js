import React, {Component} from 'react';
import { Link } from 'react-router-dom';
import axios from 'axios';
// import Modal from 'react-modal';

import WorkspaceItem from '../components/WorkspaceItem';

export default class Workspace extends Component {

componentWillMount(){
  axios.get('/workspaces')
  .then( results => this.setState({workspaces: results.data}) );
}

constructor( props ){
  super( props );

  this.state = {
      name: '',
      workspaces: []
  };
}



render() {

  if (!this.state.workspaces.length){
    return <div>Loading...</div>;
  }

  const workspaces = this.state.workspaces.map( w => <WorkspaceItem item={ w } key={ w.id } /> );

  return (
    <div className="container">
      <div>
        {workspaces}
      </div>
    </div>
  );

}



}
