class Stack
    def initialize(size)
        @stack = Array.new
        @top = -1
        @size = size
    end

    def push(ele)
        if isFull?
            # puts "Stack is full ! Cannot Add more elements"
            return nil
        else
            @stack.push(ele)
            @top += 1
        end
    end

    def top
        return nil if isEmpty?
        # puts "top ele pos:#{@top} --- Ele:#{@stack[@top]}"
        @stack[@top]
    end

    def pop
       return nil if isEmpty?
       @top -= 1
       @stack.pop()
    end

    def size
        @stack.size
    end

    def display
        puts @stack.reverse
    end

    private
    def isFull?
        @stack.length == @size
    end

    def isEmpty?
        @top == -1
    end
end

my_stack = Stack.new(3)

# Pushing eles
my_stack.push("a")
my_stack.push("b")
my_stack.push("c")

my_stack.push("d")

# Display Stack
# my_stack.display

# Size
puts my_stack.size

puts my_stack.pop
puts my_stack.pop
puts my_stack.size

puts my_stack.top