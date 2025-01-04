Class {
	#name : 'MyPawnTests',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyPawnTests >> testPawnDiagonalCapture [

	| pawn enemyPiece board squares |
	board := MyChessBoard empty.
	board at: 'e4' put: (pawn := MyPawn white).
	board at: 'd5' put: (enemyPiece := MyPawn black).
	board at: 'f5' put: MyPawn white.

	squares := pawn targetSquares.
	self
		assertCollection: squares
		includesAll: (#( e5 d5 ) collect: [ :name | board at: name ]).
	"Ne peut pas bouffer son allié"
	self deny: (squares includes: (board at: 'f5'))
]

{ #category : 'tests' }
MyPawnTests >> testPawnFirstMove2Steps [
	| pawn squares board |
	board := MyChessBoard empty.
	board at: 'e2' put: (pawn := MyPawn white).

	squares := pawn targetSquares.
	self assert: (squares includes: (board at: 'e3')).
	self assert: (squares includes: (board at: 'e4'))
]

{ #category : 'tests' }
MyPawnTests >> testPawnMoves1Step [

	| pawn squares board |
	board := MyChessBoard empty.
	board at: 'e4' put: (pawn := MyPawn white).

	squares := pawn targetSquares.
	self
		assertCollection: squares
		includesAll: (#( e5 ) collect: [ :name | board at: name ])
]
