:Namespace ProblemsEasy                         
    ∇                           
     msg←grille Grille mat                          
          msg←(,' '=grille)/,mat                            
    ∇                           
    ∇                           
     r←k TransEnc m;keylen;messlen;grid                         
        keylen←⍴k                                                                       ⍝ More readable
        m←(keylen×⌈(⍴m)÷keylen)⍴m,keylen/' '                                            ⍝ Making the length a multiple of the key length
        messlen←⍴m                                                                      ⍝ More readable
        grid←((messlen÷keylen),keylen)⍴m                                                ⍝ Built a grid from the message
        r←⊃,/(⊂[1]grid)[⍋k]                                                             ⍝ Reading grid columns in alphabetical order of key
    ∇                           
    ∇                           
     r←k TransDec m;keylen;messlen;cols                         
        keylen messlen ← (⍴k) (⍴m)                                                      ⍝ More readable
        cols←(((messlen)⍴((messlen)÷keylen)/⍳messlen)⊆m)                                ⍝ Splitting the message to columns of the grid
        cols[⍋k]←cols                                                                   ⍝ Sorting the columns
        r←⊃,/⊂[1]↑cols                                                                  ⍝ Moving the characters a bit to get the decrypted message
    ∇                           
    ∇                           
     r←TapEnc m;posgrid;alphgrid;respos                         
        alphgrid←(5 5⍴⎕A~'J')                                                           ⍝ ∧
        alphgrid[2;4]←⊂'IJ'                                                             ⍝ | Initializing Grids
        posgrid←(⍳5)∘.,⍳5                                                               ⍝ ∨
        alphgrid posgrid←(,alphgrid) (,posgrid)                                         ⍝ Flattening grids to vectors for ease of operation
        respos←(,⌈/¨↑m=⊂alphgrid)/(⊃,/(⍴m)/⊂posgrid))                                   ⍝ Search in alphgrid then get value from posgrid
        r←⊃,/{(⍵/'*'),' '}¨(⊃,/respos)                                                  ⍝ Printing each cluster of asterisks independently of the others
    ∇                           
    ∇                           
     r←TapDec m;alphgrid;lens                           
        alphgrid←(5 5⍴⎕A~'J')                                                           ⍝ Initializing alphabet grid
        lens←(⊃,/⍴¨(m≠' ')⊆m)                                                           ⍝ Getting length of each asterisks cluster in a vector
        lens←(2/⍳.5×⍴lens)⊆lens                                                         ⍝ Partition lengths into pairs for coordinates of each letter
        r←{alphgrid[(⍵[1]);(⍵[2])]}¨lens                                                ⍝ Feeding each pair to a function that gets the corresponding letter
    ∇                           
:EndNamespace                           