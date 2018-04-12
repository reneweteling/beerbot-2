Administrator.create(email: "admin@example.com", password: "password", first_name: "Rene", last_name: "Weteling")

Item.create!([
  {active: true, order: 1, name: 'Bier', description: 'Bruine pretpaaltjes', image: '', price: 0.5},
  {active: true, order: 2, name: 'Water', description: 'Helaas geen spraakwater maar wel lekker', image: '', price: 0.5},
])


# Authorization Basic YmVlcmJvdC1jbGllbnQ6c2VjcmV0
ApiClient.create!(name: 'Tablet client', description: 'Client on the wall of room 2.2', contact_person: 'Rene Weteling', contact_email: 'rene@weteling.com', client_id: 'beerbot-client', client_secret: 'secret', active: true)

User.create!([
  {first_name: 'René', last_name: 'Weteling', email: 'rene@weteling.com', image: '', slack_handle: 'rene', active: true},
  {first_name: 'Robbert', last_name: 'van Zuiden', email: 'robbert@vanzuiden.me', image: '', slack_handle: 'robbert', active: true},
  {first_name: 'Maurits', last_name: 'Dijkstra', email: 'mauritsdijkstra@gmail.com', image: '', slack_handle: 'maurits', active: true},
])