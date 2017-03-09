class Machine
  @@users = {}

  def initialize(username, password)
    @username = username
    @password = password
    @@users[username] = password
    @files = {}
  end

  def create(filename)
    time = Time.now
    @files[filename] = time
    puts "#{filename} was created by #{@username} at #{time}."
  end

  def Machine.get_users
    @@users
  end
end

my_machine = Machine.new("Boris", 012345)
your_machine = Machine.new("Anna", 123456)

my_machine.create("profile1.txt")
your_machine.create("profile2.txt")

puts "Users: #{Machine.get_users}"