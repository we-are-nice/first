import React from 'react';
import Dropzone from 'react-dropzone';
import request from 'superagent';

export default class ReactDropzone extends React.Component {
  onDrop(files){
    var file = new FormData();
    file.append('name',files[0])

    var req = request

    .post('/api/v1/contacts/import')
    .send(file);
    req.end(function(err,response){
    });
  }

  render(){
    const textStyle = {
      margin: '25px'
    }
    const dropAreaStyle = {
      width: '200px',
      height: '200px',
      borderWidth: '5px',
      borderColor: '#f0ad4e',
      borderStyle: 'dashed',
      borderRadius: '5px',
      margin: '10px'
    }
    return(
      <div>
        <Dropzone style={dropAreaStyle} onDrop={this.onDrop} accept=".csv">
          <p style={textStyle}>Drop csv file here, or click to
            select file to upload. Only *.csv files will be accepted
          </p>
        </Dropzone>
      </div>
    );
  }
}
