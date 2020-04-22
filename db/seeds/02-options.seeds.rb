puts ":::::::::::::::::::::::::::::starting options load"
(0..30).each do |n|
  print '.'
  option = Option.create!(
    :poll => Poll.all.sample,
    :description => Faker::Twitter.status[:text]
  )
end
puts ""
puts ":::::::::::::::::::::::::::::ending options load"
