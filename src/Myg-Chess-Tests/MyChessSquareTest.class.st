Class {
	#name : 'MyChessSquareTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyChessSquareTest >> testBoard [ 

    | squareTest boardTest |
    squareTest := MyChessSquareWhite new.
    boardTest := MyChessBoard empty.

    squareTest board: boardTest.
    self assert: squareTest board equals: boardTest.


]

{ #category : 'tests' }
MyChessSquareTest >> testName [ 

    | squareTest |
    squareTest := MyChessSquareBlack new.
	
    squareTest name: 'a1'.
    self assert: squareTest name equals: 'a1'.

    "Test de changement si changement de nom"
    squareTest name: 'b2'.
    self assert: squareTest name equals: 'b2'.


]

{ #category : 'tests' }
MyChessSquareTest >> testPlus [ 
	
	| squareTest result boardTest |
	
	boardTest := MyChessBoard empty. 
	squareTest := MyChessSquareBlack new. 
	squareTest name: 'e4'.
   squareTest board: boardTest. 

	result := squareTest + (1 @ 1). 
	self assert: result name equals: 'f5'. 
	
	result := squareTest + (-1 @ -1).
   self assert: result name equals: 'd3'.

]
