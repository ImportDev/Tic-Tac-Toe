class TicTacToe
    attr_accessor :board
    def initialize
        @board = [" "," "," "," "," "," "," "," "," "]
    end
    WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

    def display_board
        puts " #{board[0]} | #{board[1]} | #{board[2]} "
        puts "-----------"
        puts " #{board[3]} | #{board[4]} | #{board[5]}"
        puts "-----------"
        puts " #{board[6]} | #{board[7]} | #{board[8]} "
    end

    def input_to_index(input)
        selection = input.chomp.to_i - 1
      end

    def move(index,token = "x")
        @board[index] = token
    end

    def position_taken?(index)
        (@board[index] != " ")
        # if @board[index] == " "
        #     return false
        # else
        #     return true
        # end
    end

    def valid_move?(index)
        (@board[index] == " ")
    end

    def turn_count
        9 - @board.count(" ")
    end

    def current_player
        self.turn_count.even? ? "x" : "o"
    end

    def turn
        puts "Enter a number from 1 to 9"
        index = input_to_index(gets.chomp)
        if valid_move?(index)
            move(index, self.current_player)
            self.display_board
        else turn
        end
    end

#each takes x and o new arrays and tests as  those x and o included in a combo of 3 which is [0,1,2],[3,4,5]
#then if they find for ex: x | o | x, it selects uniq elements only results x | o until it finds a 3 combo like x,x,x or o,o,o
    def won?
        WIN_COMBINATIONS.each do |combo|
            if [['x'], ['o']].include?([@board[combo[0]], @board[combo[1]], @board[combo[2]]].uniq)
                return combo
            end
        end
        false
    end

    def full?
        @board.all? {|position| position != " "}
    end

    def draw?
        self.full? && !self.won?
    end

    def over?
        self.won? || self.draw?
    end

    def winner
        if self.won?
            (self.current_player == 'x') ? 'o' : 'x'
        end
    end

    def play
        until self.over?
            self.turn
        end
        if self.won?
            puts "Congratulations #{self.winner}!"
        elsif self.draw?
            puts "Cat's Game!"
        end
    end
end

game = TicTacToe.new
game.play
