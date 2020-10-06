user1 = User.create!(email: "paris@pick.com", password: "password")
user2 = User.create!(email: "london@pick.com", password: "password")
user3 = User.create!(email: "newyork@pick.com", password: "password")
user4 = User.create!(email: "berlin@pick.com", password: "password")
user5 = User.create!(email: "milano@pick.com", password: "password")


user1.pharmacies.create!(age: "23", sex: "女", counseling: "喉が痛い")
user2.pharmacies.create!(age: "35", sex: "男", counseling: "熱がある")
user3.pharmacies.create!(age: "29", sex: "女", counseling: "咳が止まらない")
user4.pharmacies.create!(age: "35", sex: "男", counseling: "鼻水が止まらない")
user5.pharmacies.create!(age: "30", sex: "女", counseling: "頭痛が治らない")
