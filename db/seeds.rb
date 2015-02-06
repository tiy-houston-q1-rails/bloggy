
3.times do

  body = [Faker::Lorem.paragraphs(2).join(" "),
          Faker::Lorem.paragraphs(5).join(" "),
          Faker::Lorem.paragraphs(4).join(" ")
        ].join("\n")


  post = Post.create title: Faker::Lorem.sentence, body: body, published_on: 1.day.ago
  4.times do
    Comment.create post: post, message: "#{Faker::Company.bs} --> LULZ THIS BLURG SUCX"
  end
end
