Class {
	#name : 'MyChessBoardTests',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyChessBoardTests >> testInitialize [ [

    | board |
    board := MyChessBoard new.
    self assert: board notNil
]
]

{ #category : 'tests' }
MyChessBoardTests >> testPlacePieces [ [

    | board |
    board := MyChessBoard new.
    board initializePieces.
    self assert: (board at: 'a1') contents class equals: MyRook.
    self assert: (board at: 'b1') contents class equals: MyKnight.
    self assert: (board at: 'c1') contents class equals: MyBishop.
    self assert: (board at: 'd1') contents class equals: MyQueen.
    self assert: (board at: 'e1') contents class equals: MyKing.
    self assert: (board at: 'f1') contents class equals: MyBishop.
    self assert: (board at: 'g1') contents class equals: MyKnight.
    self assert: (board at: 'h1') contents class equals: MyRook.
    self assert: (board at: 'a2') contents class equals: MyPawn.
    self assert: (board at: 'h2') contents class equals: MyPawn
]
]
