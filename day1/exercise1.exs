input = 'input.txt' |> File.read! |> to_char_list

def parens_counter([head|tail]), do: parens_counter([head|tail], 0)
def parens_counter([], count), do: count
def parens_counter([head|tail], count) do
    cond do
        head == '(' ->
            parens_counter(tail, count + 1)
        head == ')' ->
            parens_counter(tail, count - 1)
        true ->
            ""
    end
end

IO.puts parens_counter(input)
