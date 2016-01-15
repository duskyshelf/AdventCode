require 'digest'

def day4 input
  number = 0
  digest = 'xxxxxx'
  while digest != '000000' do
    number += 1
    hash = Digest::MD5.hexdigest input + number.to_s
    digest = hash[0..5]
  end
  p number
end

day4('yzbqklnj')