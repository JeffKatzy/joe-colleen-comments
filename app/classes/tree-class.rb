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

end
