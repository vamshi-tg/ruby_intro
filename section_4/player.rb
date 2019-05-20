class Player
    def name
        @name
    end

    def name=(value)
        @name = value
    end

    def self.team
        'Team India'
    end
end

p1 = Player.new
p1.name=("Virat")
puts p1.name
puts Player.team

p2 = Player.new
p2.name=("Dhoni")
puts p2.name
puts Player.team
