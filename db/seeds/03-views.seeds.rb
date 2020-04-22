puts ":::::::::::::::::::::::::::::starting views load"
(0..400).each do |n|
  print '.'
  view = View.create!(
    :poll => Poll.all.sample
  )
end
puts ""
puts ":::::::::::::::::::::::::::::ending views load"
