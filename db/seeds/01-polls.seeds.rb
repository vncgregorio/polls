puts ":::::::::::::::::::::::::::::starting poll load"
questions = [
  "O quê vc acha do",
  "Qual dessas opções reflete sua experiência com",
  "Como você conheceu o app",
  "Qual funcionalidade você mais utilizou no",
]
(0..5).each do |n|
  print '.'
  poll = Poll.create!(:description => "#{questions.sample} #{Faker::App.name}?")
end
puts ""
puts ":::::::::::::::::::::::::::::ending poll load"
