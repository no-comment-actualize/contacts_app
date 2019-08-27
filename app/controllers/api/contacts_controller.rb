class Api::ContactsController < ApplicationController

  def one_contact_method
    @contact = Contact.first
    render 'one_contact.json.jb'
  end

  def all_contacts_method
    @contacts = Contact.all #array of contacts
    render 'all_contacts.json.jb'
  end

end
