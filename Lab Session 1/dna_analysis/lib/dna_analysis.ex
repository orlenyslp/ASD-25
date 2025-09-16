defmodule DnaAnalysis do

    def count([], _), do: 0
    def count([head | tail], n) when n == head, do: 1 + count(tail, n)
    def count([_ | tail], n), do: count(tail, n)    

    def histogram(dna) do
        %{
            ?A => count(dna, ?A), 
            ?T => count(dna, ?T), 
            ?C => count(dna, ?C), 
            ?G => count(dna, ?G)
        }
    end
    

end
