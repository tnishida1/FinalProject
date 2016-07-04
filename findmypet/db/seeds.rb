
owners = Owner.create(
  [
    { first: "Sally", last: "Jones", zipcode: 11111, user_id: 1},
    { first: "Fred", last: "Smith", zipcode: 22222, user_id: 2}

  ]
)

pets = Pet.create(
  [
    { name: "Fido", claimed: "f", filename: "1.jpg", owner_id: owners[0].id},
    { name: "Dingo", claimed: "false", filename: "2.jpg", owner_id: owners[0].id},
    { name: "Bongo", claimed: "true", filename: "3.jpg", owner_id: owners[1].id}
  ]
)



