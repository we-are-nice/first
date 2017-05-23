import React from 'react';
var ReactBSTable = require('react-bootstrap-table');
var BootstrapTable = ReactBSTable.BootstrapTable;
var TableHeaderColumn = ReactBSTable.TableHeaderColumn;

export default class ContactsTable extends React.Component {
  handleDelete(id) {
    this.props.handleDelete(id);
  };

  showDotComEmailAddresses = () => {
    this.refs.table.handleFilterData({ email_address: '.com' });
  };

  showAllEmailAddresses = () => {
    this.refs.table.handleFilterData({ email_address: '' });
  };

  render() {
    function onAfterDeleteRow() {
      alert('Contact has been succesfully deleted');
    };

    const options = {
      afterDeleteRow: onAfterDeleteRow  // A hook for after droping rows.
    };

    // If you want to enable deleteRow, you must enable row selection also.
    const selectRowProp = {
      mode: 'checkbox'
    };

    const buttonStyle = {
      margin: '10px'
    }

    return (
      <div>
        <button style={buttonStyle} onClick={ this.showDotComEmailAddresses } className='btn btn-success'>Show contacts with '.com' email address</button>
        <button onClick={ this.showAllEmailAddresses } className='btn btn-success'>Show all contacts</button>
        <BootstrapTable ref='table' data={ this.props.contacts } deleteRow={ true } selectRow={ selectRowProp } options={ options }>
          <TableHeaderColumn width='30px' dataField='id' isKey={ true } hidden={ true }>id</TableHeaderColumn>
          <TableHeaderColumn width='90px' dataField='first_name' >First Name</TableHeaderColumn>
          <TableHeaderColumn width='98px' dataField='last_name' >Last Name</TableHeaderColumn>
          <TableHeaderColumn width='302px' dataField='email_address' dataSort={ true }>Email Address</TableHeaderColumn>
          <TableHeaderColumn width='157px' dataField='phone_number' >Phone Number</TableHeaderColumn>
          <TableHeaderColumn width='282px' dataField='company_name' >Company Name</TableHeaderColumn>
        </BootstrapTable>
      </div>
    )
  }
}
