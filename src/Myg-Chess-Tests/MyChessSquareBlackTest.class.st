Class {
	#name : 'MyChessSquareBlackTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyChessSquareBlackTest >> testBlackContents [ 

    | blackSquareTest whitePiece blackPiece boardTest |

    boardTest := MyChessBoard empty.
    boardTest whiteColor: Color white.
    boardTest blackColor: Color black.

    blackSquareTest := MyChessSquareBlack new.
    blackSquareTest board: boardTest. 

    whitePiece := MyBishop white. 
    blackPiece := MyBishop black. 

    blackSquareTest contents: whitePiece.
    self assert: (blackSquareTest contents) equals: whitePiece.
]

{ #category : 'tests' }
MyChessSquareBlackTest >> testBlackForeground [ 

    | blackSquare board |

    board := MyChessBoard empty.
    board blackColor: Color pink.
    board whiteColor: Color orange.

    "Test case noire"
    blackSquare := MyChessSquareBlack new.
    blackSquare board: board.
    self assert: blackSquare foreground equals: Color pink.
]

{ #category : 'tests' }
MyChessSquareBlackTest >> testBlackNegativeColor [ 
    
    self assert: MyChessSquareBlack new negatedColor equals: Color white.
]

{ #category : 'tests' }
MyChessSquareBlackTest >> testBlackRenderBishop [  

	| squareTest whiteBishop blackBishop |
	squareTest := MyChessSquareBlack new.
	
	"Test fou blanc sur case blanche"
	whiteBishop := MyBishop white. 
	self assert: (squareTest renderBishop: whiteBishop) equals: 'b'.
	
	"Test fou noir sur case blanche"
	blackBishop := MyBishop black. 
	self assert: (squareTest renderBishop: blackBishop) equals: 'v'.
]

{ #category : 'tests' }
MyChessSquareBlackTest >> testBlackRenderKing [ 

	| squareTest whiteKing blackKing |
	squareTest := MyChessSquareBlack new.
	
	"Test roi blanc sur case blanche"
	whiteKing := MyKing white. 
	self assert: (squareTest renderKing: whiteKing) equals: 'k'.
	
	"Test roi noir sur case blanche"
	blackKing := MyBishop black. 
	self assert: (squareTest renderKing: blackKing) equals: 'l'.
]

{ #category : 'tests' }
MyChessSquareBlackTest >> testBlackRenderKnight [ 

	| squareTest whiteKnight blackKnight |
	squareTest := MyChessSquareBlack new.
	
	"Test cavalier blanc sur case blanche"
	whiteKnight := MyKnight white. 
	self assert: (squareTest renderKnight: whiteKnight) equals: 'n'.
	
	"Test cavalier noir sur case blanche"
	blackKnight := MyKnight black. 
	self assert: (squareTest renderKnight: blackKnight) equals: 'm'.
]

{ #category : 'tests' }
MyChessSquareBlackTest >> testBlackRenderPawn [ 

	| squareTest whitePawn blackPawn |
	squareTest := MyChessSquareBlack new.
	
	"Test pion blanc sur case blanche"
	whitePawn := MyPawn white. 
	self assert: (squareTest renderPawn: whitePawn) equals: 'p'.
	
	"Test pion noir sur case blanche"
	blackPawn := MyPawn black. 
	self assert: (squareTest renderPawn: blackPawn) equals: 'o'.
]

{ #category : 'tests' }
MyChessSquareBlackTest >> testBlackRenderQueen [ 

	| squareTest whiteQueen blackQueen |
	squareTest := MyChessSquareBlack new.
	
	"Test reine blanche sur case blanche"
	whiteQueen := MyQueen white. 
	self assert: (squareTest renderQueen: whiteQueen) equals: 'q'.
	
	"Test pion noir sur case blanche"
	blackQueen := MyQueen black. 
	self assert: (squareTest renderQueen: blackQueen) equals: 'w'.
]

{ #category : 'tests' }
MyChessSquareBlackTest >> testBlackRenderRook [ 

	| squareTest whiteRook blackRook |
	squareTest := MyChessSquareBlack new.
	
	"Test tour blanche sur case blanche"
	whiteRook := MyRook white. 
	self assert: (squareTest renderRook: whiteRook) equals: 'r'.
	
	"Test tour noir sur case blanche"
	blackRook := MyRook black. 
	self assert: (squareTest renderRook: blackRook) equals: 't'.
]
