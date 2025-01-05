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
MyPawnTests >> testPawnEnPassantCapture [

	| pawn enemyPawn board squares |
	board := MyChessBoard empty.

	"Placer un pion noir sur sa position initiale et le déplacer de deux cases."
	board at: 'd7' put: (enemyPawn := MyPawn black).
	enemyPawn moveTo: (board at: 'd5').

	"Placer un pion blanc à proximité."
	board at: 'e5' put: (pawn := MyPawn white).

	"Vérifier les cibles disponibles pour le pion blanc."
	squares := pawn targetSquares.

	"Vérifie qu'il n'y a qu'une seule cible en diagonale pour la prise en passant."
	self assert: (squares includes: (board at: 'd6')).
	self deny: (squares includes: (board at: 'f6')).

	"Vérifie que les mouvements possibles incluent la prise en passant et le déplacement vers l'avant."
	self
		assertCollection: squares
		includesAll: (#( d6 e6 ) collect: [ :name | board at: name ]).

	"Simuler la prise en passant."
	pawn moveTo: (board at: 'd6').

	"Vérifier que le plateau est correctement mis à jour."
	self assert: (board at: 'd6') contents = pawn.
	self assert: (board at: 'd5') contents isNil "Vérifie que la case d5 est vide."
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
