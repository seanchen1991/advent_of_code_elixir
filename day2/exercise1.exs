input = 'input.txt' |> File.read! |> String.split("\n")

def get_min(values), do: get_min([head|tail], :nil)
def get_min([], current), do: current
def get_min([head|tail], current), do: get_min(tail, min(head, current))

IO.puts Enum.reduce input, 0, fn
    (dimensions, acc) ->
        [l, w, h] = String.split(dimensions, "x")
        extra = get_min([l, w, h])
        2 * (l * w + w * h + h * l) + extra
    end
