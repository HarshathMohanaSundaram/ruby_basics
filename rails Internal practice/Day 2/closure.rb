def make_counter
  count = 0
  lambda { count += 1 }
end


counter = make_counter
puts counter.call # Output: 1
puts counter.call # Output: 2
puts counter.call # Output: 3


def bank_account(initial_balance)
  balance = initial_balance
  {
    deposit: -> (amount) { balance += amount },
    withdraw: -> (amount) { balance -= amount },
    balance: -> { balance }
  }
end


account = bank_account(100)
account[:deposit].call(50)
account[:withdraw].call(30)
puts account[:balance].call # Output: 120


def my_map(array)
  result = []
  array.each { |element| result << yield(element) }
  result
end


puts my_map([1, 2, 3]) { |num| num * 10 }.inspect # Output: [10, 20, 30]


def delay(delay, &block)
  -> {
    sleep(delay)
    block.call
  }
end

task = delay(2) { puts "Task executed after 2 seconds" }

task.call


funcs = []

3.times do |i|
  funcs << Proc.new { puts i }
end

i = 100

funcs.each(&:call)
#Output:
#0
#1
#2

