users = User.create(
  [
    { email: 'a@a.com', password: "a", password_confirmation: "a"},
    { email: 'b@b.com', password: "b", password_confirmation: "b"},
    { email: 'c@c.com', password: "c", password_confirmation: "c"},
    { email: 'd@d.com', password: "d", password_confirmation: "d"},
    { email: 'e@e.com', password: "e", password_confirmation: "e"},
 ]
)

owners = Owner.create(
  [
    { first: "Alex", last: "Henry", zipcode: 12634, user_id: 1},
    { first: "Brad", last: "Pitman", zipcode: 66134, user_id: 2},
    { first: "Callie", last: "Cosby", zipcode: 99991, user_id: 3},
    { first: "Dorothy", last: "George", zipcode: 13622, user_id: 4},
    { first: "Mac", last: "Carlin", zipcode: 12532, user_id: 5}
  ]
)

pets = Pet.create(
  [
    { name: "Tyson", description: "Please I lost my dog help", filename: "1.jpg", owner_id: owners[1].id},
    { name: "Henry", description: "where has my dog gone", filename: "2.jpg", owner_id: owners[2].id},
    { name: "James", description: "oh where can he be", filename: "3.jpg", owner_id: owners[3].id},
    { name: "Sam", description: "I lost my dog help", filename: "4.jpg", owner_id: owners[2].id},
    { name: "Bob", description: "Where's my cat", filename: "5.jpg", owner_id: owners[1].id},
    { name: "Carl", description: "Please help dog lost", filename: "6.jpg", owner_id: owners[2].id},
    { name: "Jamie", description: "Cat", filename: "7.jpg", owner_id: owners[0].id},
    { name: "Harry", description: "I lost my dog help", filename: "8.jpg", owner_id: owners[4].id},
    { name: "Julie", description: "Where's my cat", filename: "9.jpg", owner_id: owners[4].id},
    { name: "Misha", description: "Please help dog lost", filename: "10.jpg", owner_id: owners[0].id},
  ]
)

posts = Post.create(
  [
    { post_type: "found", owner_id: owners[1].id, pet_id: 1},
    { post_type: "found", owner_id: owners[2].id, pet_id: 2},
    { post_type: "lost", owner_id: owners[3].id, pet_id: 3},
    { post_type: "found", owner_id: owners[0].id, pet_id: 4},
    { post_type: "found", owner_id: owners[2].id, pet_id: 5},
    { post_type: "lost", owner_id: owners[1].id, pet_id: 6},
    { post_type: "lost", owner_id: owners[3].id, pet_id: 7},
    { post_type: "found", owner_id: owners[4].id, pet_id: 8},
    { post_type: "lost", owner_id: owners[4].id, pet_id: 9},
    { post_type: "lost", owner_id: owners[0].id, pet_id: 10},
  ]
)
