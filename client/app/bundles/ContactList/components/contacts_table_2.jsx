import React from 'react';

export default class ContactsTable extends React.Component {
  handleDelete(id) {
    this.props.handleDelete(id);
  };

  render() {
    var tableStyle = {
      width: '100%',
      textAlign: "left"
    };
    var contacts = this.props.contacts.map((contact) => {
      return (
        <tr key={contact.id}>
          <td>{contact.first_name}</td>
          <td>{contact.last_name}</td>
          <td>{contact.email_address}</td>
          <td>{contact.phone_number}</td>
          <td>{contact.company_name}</td>
          <td><button onClick={this.handleDelete.bind(this, contact.id)} >Delete</button></td>
        </tr>
      )
    });

    return (
      <div>
        <table style={tableStyle}>
          <tbody>
            <tr>
              <th>First Name </th>
              <th>Last Name </th>
              <th>Email Address </th>
              <th>Phone Number </th>
              <th>Company Name </th>
            </tr>
            {contacts}
          </tbody>
        </table>
      </div>
    )
  }
}
