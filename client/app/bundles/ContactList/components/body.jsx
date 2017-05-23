import React from 'react';
import ContactsTable from './contacts_table';

export default class Body extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      contacts: []
    };
  }

  componentDidMount() {
    $.getJSON('/api/v1/contacts.json', (response) => { this.setState({ contacts: response }) });
  };

  handleDelete(id) {
    $.ajax({
      url: `/api/v1/contacts/${id}`,
      type: 'DELETE',
      dataType: 'script',
      success:() => {
        this.removeContact(id);
      }
    });
  };

  removeContact(id) {
    var newContacts = this.state.contacts.filter((contact) => {
      return contact.id != id;
    });

    this.setState({ contacts: newContacts });
  };

  render() {
    return (
      <div>
        <ContactsTable contacts={this.state.contacts} handleDelete={this.handleDelete} />
      </div>
    )
  }
}
