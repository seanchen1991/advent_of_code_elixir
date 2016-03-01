input = 'input.txt' |> File.read! |> String.split("\n")

defmodule Day5 do

    @double for n <- ?a..?z, do: to_string [n, n]
    @forbidden ['ab', 'cd', 'pq', 'xy']

    def first_check(string) do
        Enum.find(@forbidden, false, &(String.contains?(string, &1)))
    end

    def second_check(string) do
        Enum.find(@double, false, &(String.contains?(string, &1)))
    end

    def third_check(string) do
        length(for n <- to_char_list(string), n in [?a, ?e, ?i, ?o, ?u], do: n) > 2
    end

    def nice_string?(string) do
        if first_check(string) do
            second_check(string) && third_check(string)
        else
            false
        end
    end
end

IO.puts Enum.reduce(input, 0, &(if Day5.nice_string?(&1), do: &2 + 1, else: &2))
