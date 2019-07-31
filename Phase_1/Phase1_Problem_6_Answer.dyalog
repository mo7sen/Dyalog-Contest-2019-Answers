⍝ Problem 6: Telephone Names

{keypad←'0' '1' '2ABC' '3DEF' '4GHI' '5JKL' '6MNO' '7PQRS' '8TUV' '9WXYZ'⋄⊃,/{¯1+(⍵∊¨keypad)/⍳10}¨⍵}