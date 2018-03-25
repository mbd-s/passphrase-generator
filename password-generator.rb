require 'pdf-reader'

reader = PDF::Reader.new('dicewarewordlist.pdf')

password = ''
5.times do
  key = 5.times.map{ rand(1..6) }.join('').to_s
  reader.pages.each do |page|
    text = page.text.split
    if text.include?(key)
      password << ' ' + text[text.index(key) + 1]
    end
  end
end

puts password
