users = User.create(
  [
    { email: "s@s.com", password: "s", password_confirmation: "s"},
    { email: "f@f.com", password: "f", password_confirmation: "f"}
  ]
)

owners = Owner.create(
  [
    { first: "Sally", last: "Jones", zipcode: 11111, user_id: 1},
    { first: "Fred", last: "Smith", zipcode: 22222, user_id: 2}

  ]
)

pets = Pet.create(
  [
    { name: "Fido", description: "Corgi", filename: "1.jpg", lost: 'f', found: 't', owner_id: owners[0].id},
    { name: "Dingo", description: "dog2", filename: "2.jpg", lost: 't', found: 'f', owner_id: owners[0].id},
    { name: "Bongo", description: "dog3", filename: "3.jpg", lost: 'f', found: 't', owner_id: owners[1].id}
  ]
)
