Class {
	#name : 'MyPieceTests',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyPieceTests >> testBishopMoves [ [

    | board bishop moves |
    board := MyChessBoard new.
    bishop := MyBishop white.
    board at: 'e4' put: bishop.
    moves := bishop targetSquaresLegal: true.
    self assert: (moves includes: (board at: 'f5')).
    self assert: (moves includes: (board at: 'g6')).
    self assert: (moves includes: (board at: 'h7')).
    self assert: (moves includes: (board at: 'd5')).
    self assert: (moves includes: (board at: 'c6')).
    self assert: (moves includes: (board at: 'b7')).
    self assert: (moves includes: (board at: 'a8')).
    self assert: (moves includes: (board at: 'd3')).
    self assert: (moves includes: (board at: 'c2')).
    self assert: (moves includes: (board at: 'b1'))
]
]

{ #category : 'tests' }
MyPieceTests >> testKingMoves [ [

    | board king moves |
    board := MyChessBoard new.
    king := MyKing white.
    board at: 'e4' put: king.
    moves := king targetSquaresLegal: true.
    self assert: (moves includes: (board at: 'e5')).
    self assert: (moves includes: (board at: 'f5')).
    self assert: (moves includes: (board at: 'f4')).
    self assert: (moves includes: (board at: 'f3')).
    self assert: (moves includes: (board at: 'e3')).
    self assert: (moves includes: (board at: 'd3')).
    self assert: (moves includes: (board at: 'd4')).
    self assert: (moves includes: (board at: 'd5'))
]
]

{ #category : 'tests' }
MyPieceTests >> testKnightMoves [ [

    | board knight moves |
    board := MyChessBoard new.
    knight := MyKnight white.
    board at: 'e4' put: knight.
    moves := knight targetSquaresLegal: true.
    self assert: (moves includes: (board at: 'f6')).
    self assert: (moves includes: (board at: 'd6')).
    self assert: (moves includes: (board at: 'g5')).
    self assert: (moves includes: (board at: 'c5')).
    self assert: (moves includes: (board at: 'g3')).
    self assert: (moves includes: (board at: 'c3')).
    self assert: (moves includes: (board at: 'f2')).
    self assert: (moves includes: (board at: 'd2'))
]
]

{ #category : 'tests' }
MyPieceTests >> testPawnMoves [ [

    | board pawn moves |
    board := MyChessBoard new.
    pawn := MyPawn white.
    board at: 'e2' put: pawn.
    moves := pawn targetSquaresLegal: true.
    self assert: (moves includes: (board at: 'e3'))
]
]

{ #category : 'tests' }
MyPieceTests >> testQueenMoves [ [

    | board queen moves |
    board := MyChessBoard new.
    queen := MyQueen white.
    board at: 'e4' put: queen.
    moves := queen targetSquaresLegal: true.
    self assert: (moves includes: (board at: 'e5')).
    self assert: (moves includes: (board at: 'f5')).
    self assert: (moves includes: (board at: 'f4')).
    self assert: (moves includes: (board at: 'f3')).
    self assert: (moves includes: (board at: 'e3')).
    self assert: (moves includes: (board at: 'd3')).
    self assert: (moves includes: (board at: 'd4')).
    self assert: (moves includes: (board at: 'd5')).
    self assert: (moves includes: (board at: 'f6')).
    self assert: (moves includes: (board at: 'g6')).
    self assert: (moves includes: (board at: 'h7')).
    self assert: (moves includes: (board at: 'd5')).
    self assert: (moves includes: (board at: 'c6')).
    self assert: (moves includes: (board at: 'b7')).
    self assert: (moves includes: (board at: 'a8')).
    self assert: (moves includes: (board at: 'd3')).
    self assert: (moves includes: (board at: 'c2')).
    self assert: (moves includes: (board at: 'b1'))
]
]

{ #category : 'tests' }
MyPieceTests >> testRookMoves [ [

    | board rook moves |
    board := MyChessBoard new.
    rook := MyRook white.
    board at: 'e4' put: rook.
    moves := rook targetSquaresLegal: true.
    self assert: (moves includes: (board at: 'e5')).
    self assert: (moves includes: (board at: 'e6')).
    self assert: (moves includes: (board at: 'e7')).
    self assert: (moves includes: (board at: 'e8')).
    self assert: (moves includes: (board at: 'd4')).
    self assert: (moves includes: (board at: 'c4')).
    self assert: (moves includes: (board at: 'b4')).
    self assert: (moves includes: (board at: 'a4')).
    self assert: (moves includes: (board at: 'f4')).
    self assert: (moves includes: (board at: 'g4')).
    self assert: (moves includes: (board at: 'h4')).
    self assert: (moves includes: (board at: 'e3')).
    self assert: (moves includes: (board at: 'e2')).
    self assert: (moves includes: (board at: 'e1'))
]
]
