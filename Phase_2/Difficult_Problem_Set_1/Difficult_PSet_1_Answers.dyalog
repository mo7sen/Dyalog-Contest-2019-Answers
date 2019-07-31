:Namespace ProblemsDifficult
    ∇
     r←s MakeBoard d
        r←s⍴{⊃(?⍴⍵)⌷⍵}¨d
    ∇
    ∇
     words←GetWordList f
        text←⊃⎕NGET f 1
        valid←⊃,/{(0<⍴⍵)∧(~' '∊⍵)}¨text
        words←1(819⌶)valid/text
    ∇
    ∇
      found←words FindWords board;visited;positions;flat;found_places
        visited←0⍴⍨⍴board
        positions←,⍳⍴board
        flat←,board
        found_places←{
            startcells←(⊃¨(⊂⍵){⍵⍷⍺}¨flat)/positions ⋄
            (0=⍴startcells):0 ⋄
            (⊂⍵){⍵ TraceWord(⍺ board visited)}¨startcells
        }¨words
        found←(⊃¨found_places)/words
    ∇
    ∇
      valid←pos TraceWord args;word;board;visited;cell;boardwid;boardheig;cndneigh;neigh;drop
        word board visited←args[⍳3]
        cell←⊃board[pos[1];pos[2]]
        boardwid boardheig←(⍴board)[2 1]
        :If 0=⍴word
            valid←1
        :Else
            :If (~visited[pos[1];pos[2]])∧⊃cell⍷word
                visited[pos[1];pos[2]]←1
                cndneigh←(⊂pos)+(,¯1 0 1∘.,¯1 0 1)              ⍝ candidate neighbours
                neigh←(cndneigh∊⍳boardheig boardwid)/cndneigh   ⍝ within board
                drop←{0=⍴⍴⍵:1⋄⍴⍵}cell
                valid←⌈/{(⌊/⍵=pos):0 ⋄ ⍵ TraceWord (word↓⍨drop)board visited}¨neigh
            :Else
                valid←0
            :EndIf
        :EndIf
    ∇
    ∇
     results←BoggleScore answers
        score ← +/(0 1 2 3 5 11)[0 3 5 6 7 8⍸⍴¨answers]
        bigwords ← ⊃+/(⍴¨answers)>2
    ∇
:EndNamespace