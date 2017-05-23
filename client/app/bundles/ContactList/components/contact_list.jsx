import React from 'react';
import Header from './header';
import Body from './body';
import ReactDropzone from './react_dropzone';

export default class ContactList extends React.Component {
  render() {
    return (
      <div>
        <Header />
        <ReactDropzone />
        <Body />
      </div>
    )
  }
}
