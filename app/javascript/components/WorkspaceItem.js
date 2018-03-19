import React, { Component } from 'react';


export default class WorkspaceItem extends Component {

constructor( props ){
  super( props );

  this.state = {
    name: '',
    sprint: null

  }
}

render() {

  const sprintList = this.props.item.sprints.map( sprint =>  (
      <div key={sprint.id}>
        <span>{ sprint.start } to { sprint.end }</span>
        <button>Share</button>
      </div>
  ));

  return(
    <div>
      <button className="btn pull-right">Add New Workspace</button>
      <h1>{this.props.item.name}</h1>
      <strong>Sprints:</strong>
      {sprintList}
    </div>
  )
}

}
