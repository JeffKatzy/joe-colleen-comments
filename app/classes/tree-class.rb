class Tree


  def self.build_tree
    newtree = []
    newtree << [" ","_","_","_"]
    newtree << [" ","|"," ","|"]
    (1..5).each do
      newtree << [" "," "," ","|"]
    end
    newtree << [" "," ","-","-"]
    newtree
  end

  def self.mistake_tree_arr
    [[" ", "O", " "],
     ["(", "|", ")"],
     [" ", "|", " "],
     ["<", " ", ">"]]
  end

  def self.add_part_to_tree(body_part,new_hangman)
    Tree.mistake_tree_arr.each_with_index do |v, row|
      v.each_with_index do |vv, column|
        if Tree.mistake_tree_arr[row][column] == body_part
          new_hangman.tree[row+2][column] = body_part
        end
      end
    end
  end

end
