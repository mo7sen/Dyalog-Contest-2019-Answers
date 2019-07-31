⍝ Problem 3: Grade Distribution

{grades←'ABCDF'⋄⍉↑(⍴⍵){⍵,(1E¯1×⌊.5+(1E3)×⍵[2]÷⍺)}(grades)(+/grades∘.=⍵)}