$vals = {}
$params = {"-m"=>"ref","-k"=>"key","-b"=>"bud"}
$indexList = {"-m" => 0,"-k" => 1,"-b" => 2}


def setConVal(ref, key, bud)

  $vals = {"-m"=>ref,"-k"=>key,"-b"=>bud}

end

def convert(from, value, to)
  total = value.to_f
  index = 0

  if $indexList[from].to_i < $indexList[to].to_i or (from == "-$" and from != to)
    $vals.each_with_index{ |key, value|
        if  (index >= $indexList[from].to_i + 1 or from == "-$") and index < $indexList[to].to_i + 1
          total = total / key[1].to_f
        end
        index += 1
    }
  elsif from == to
    puts "Same values"
  else
    $vals.each_with_index{ |key, value|
        if index < $indexList[from].to_i + 1  and (index >= $indexList[to].to_i + 1  or to == "-$")
          total = total * key[1].to_f
       end
        index += 1
    }
  end
  puts total
end
