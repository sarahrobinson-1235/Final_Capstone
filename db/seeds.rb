User.create!([
  {name: "Sarah", 
  email: "sarah@gmail.com", 
  image_url: "https://i.pinimg.com/originals/f2/77/05/f277052bddd1b3f54d5f1d46abdc416a.jpg", 
  password: "password"},
  {name: "Toni", 
  email: "toni@gmail.com", 
  image_url: "https://i.pinimg.com/originals/f2/77/05/f277052bddd1b3f54d5f1d46abdc416a.jpg", 
  password: "password"},
  {name: "Kerry", 
  email: "kerry@gmail.com", 
  image_url: "https://i.pinimg.com/originals/f2/77/05/f277052bddd1b3f54d5f1d46abdc416a.jpg", 
  password: "password"}
])

Post.create!([
  {
    name: "Hi gorgeous!", 
    body: "You are as beautiful as a sunflower", image_url: 
    "https://hgtvhome.sndimg.com/content/dam/images/grdn/fullset/2014/4/22/0/CI_sun-a-00584.jpg.rend.hgtvcom.616.822.suffix/1452656436019.jpeg", 
    user_id: 1
  },
  {
    name: "Power", 
    body: "I am a powerful and independent being", 
    image_url: nil, 
    user_id: 2
  },
  {
    name: "Dinero", 
    body: "I attract wealth and success", image_url: nil, 
    user_id: 3
  },
  {
    name: "Perserverance", 
    body: "I never give up on my dreams and goals", 
    image_url: nil, 
    user_id: 1
  }
])

Board.create([
  {
    title: "Happiness",
    description: "Affirmations that make me smile",
    user_id: 1
  },
  {
    title: "Daily Verbals",
    description: "Affirmations that I like to say aloud everyday",
    user_id: 2
  },
  {
    title: "Strength",
    description: "Affirmations that make me feel strong",
    user_id: 3
  },

  
])

BoardPost.create([
  {
    post_id: 1,
    board_id: 2
  },
  {
    post_id: 2,
    board_id: 2
  },
  {
    post_id: 4,
    board_id: 3
  },
  {
    post_id: 1,
    board_id: 1
  },
  {
    post_id: 3,
    board_id: 2
  },
])
