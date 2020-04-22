puts ":::::::::::::::::::::::::::::starting votes load"
(0..180).each do |n|
  print '.'
  vote = Vote.create!(
    :option => Option.all.sample
  )
end
puts ""
puts ":::::::::::::::::::::::::::::ending votes load"
