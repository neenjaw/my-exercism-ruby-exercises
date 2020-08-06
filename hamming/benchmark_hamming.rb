require 'benchmark'

strand_a = 'ACTG' * 100_000
strand_b = 'ATCG' * 100_000

puts(Benchmark.measure do
  100.times do |i|
    puts i
    strand_a.each_char.zip(strand_b.each_char).count { |pair| pair[0] != pair[1] }
  end
end)
# => 9.464788   0.068036   9.532824 (  9.533504)

puts(Benchmark.measure do
  100.times do |i|
    puts i
    strand_a.chars.zip(strand_b.chars).count { |pair| pair[0] != pair[1] }
  end
end)
# => 4.965625   0.000000   4.965625 (  4.965865)