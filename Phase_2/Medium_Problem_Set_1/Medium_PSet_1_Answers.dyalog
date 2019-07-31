:Namespace ProblemsMedium                           
    ∇                           
     r←Degrees t;treevec;nodecount                          
        treevec←↓1↓t                                                                    ⍝ Omitting the metadata of the tree then flattening the edges to a vector
        nodecount←⊃1 1↑t                                                                ⍝ Extracting node count from the input
        r← +/¨↓(⍳nodecount)∘.=⊃,/treevec                                                ⍝ Counting appearances of each node in the edges
    ∇                           
    ∇                           
     r←DoubleDegrees t;degrees;neighbours                           
        treevec←↓1↓t                                                                    ⍝ Omitting the metadata of the tree then flattening the edges to a vector
        nodecount←⊃1 1↑t                                                                ⍝ Extracting node count from the input
        degrees← Degrees t                                                              ⍝ Calculating degree of every node
        neighbours← nodecount⍴⊂''                                                       ⍝ Initializing the neighbours vector as empty nested elements
        {neighbours[⍵[2 1]],←⍵[1 2]}¨treevec                                            ⍝ Adding nodes, in edges, to each other's set of neighbours
        r←{+/degrees[⍵]}¨neighbours                                                     ⍝ Adding the degree of all neighbours for each node
    ∇
    ∇
     r←Components t;treevec;nodecount;neighbours;visited
        r←0
        treevec←↓1↓t                                                                    ⍝ Omitting the metadata of the tree then flattening the edges to a vector
        nodecount←⊃1 1↑t                                                                ⍝ Extracting node count from the input
        neighbours←nodecount⍴⊂''                                                        ⍝ Initializing the neighbours vector as empty nested elements
        {neighbours[⍵[2 1]],←⍵[1 2]}¨treevec                                            ⍝ Adding nodes, in edges, to each other's set of neighbours
        visited←nodecount⍴0                                                             ⍝ To keep track of already scanned nodes
        :While ~⌊/visited                                                               ⍝ While there is an unvisited node
            {(0=⍴⍵): ⋄ (⌊/visited[⍵]): ⋄ visited[⍵]←1 ⋄ ∇∪⊃,/neighbours[⍵]},visited⍳0   ⍝ Recursively look for all connected neighbours to the first unvisited node
            r+←1                                                                        ⍝ Once all nodes in a subgraph are scanned, increment the number of subgraphs by 1
        :EndWhile
    ∇ 
:EndNamespace