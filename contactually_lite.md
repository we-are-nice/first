Contactually Lite
=================

At its core, Contactually is an online database for your contacts. Your task
is to build a very basinc web interface for this database that accepts file
uploads, stores the data in a relational database, and displays the information
back to the user. This is an un-timed exercise, but we ask that you don't spend
more than a few hours.

Your application must:

1. Be built in Ruby on Rails (whichever version you want).
2. Allow a user to upload a tab-delimited file of contacts via a web form. The
file will contain the following columns: first_name, last_name, email_address,
phone_number, company_name. There's an example file included.
3. Parse the given file, normalize the data, and store the information in a
relational database.
4. Display the list of contacts and their data.
5. (**Bonus**) Allow deleting specific contacts via Ajax.

Your application does not need to handle authentication or authorization.