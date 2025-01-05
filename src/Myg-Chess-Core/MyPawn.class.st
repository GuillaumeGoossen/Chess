Class {
	#name : 'MyPawn',
	#superclass : 'MyPiece',
	#instVars : [
		'hasJustMovedTwoSteps'
	],
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'rendering' }
MyPawn >> canAdvanceTo: aSquare [
    "Vérifie si le pion peut avancer sur une case donnée."
    ^ aSquare notNil and: [ aSquare hasPiece not ].
]

{ #category : 'rendering' }
MyPawn >> canCaptureEnPassantOn: aSquare [
	"Vérifie si le pion peut capturer en passant sur une case donnée."

	^ (aSquare notNil and: [ "La case cible est vide."
		   aSquare hasPiece not ]) and: [
		  | adjacentPawn |
		  adjacentPawn := aSquare column < square column
			          ifTrue: [ square left ifNotNil: [ square left contents ] ]
						 ifFalse: [ square right ifNotNil: [ square right contents ] ].
		  ((adjacentPawn notNil and: [ adjacentPawn isPawn ]) and: [
			   adjacentPawn color ~= self color ]) and: [
			  adjacentPawn hasJustMovedTwoSteps ] ]
]

{ #category : 'rendering' }
MyPawn >> canCaptureOn: aSquare [
	"Vérifie si le pion peut capturer une pièce sur une case donnée."
	^ (aSquare notNil and: [ aSquare hasPiece ]) and: [
		  aSquare contents color ~= self color ]
]

{ #category : 'rendering' }
MyPawn >> hasJustMovedTwoSteps [
    "Retourne vrai si ce pion a avancé de deux cases au tour précédent."
    ^ hasJustMovedTwoSteps ifNil: [ false ].
]

{ #category : 'accessing' }
MyPawn >> id [

	^ 'P'
]

{ #category : 'rendering' }
MyPawn >> isDiagonalMoveLegal: aSquare [
    "Vérifie si un déplacement diagonal est possible pour une capture."
    ^ self canCaptureOn: aSquare.
]

{ #category : 'rendering' }
MyPawn >> isInStartingPosition [

	^ (self isWhite and: [ square file = $2 ]) or:
		  (self isWhite not and: [ square file = $7 ])
]

{ #category : 'rendering' }
MyPawn >> isPawn [
    "Renvoie true si la pièce est un pion."
    ^ self class = MyPawn

]

{ #category : 'rendering' }
MyPawn >> moveTo: aSquare [
	"Déplace le pion vers une case donnée, en gérant la logique de prise en passant et de double mouvement."

	(self legalTargetSquares includes: aSquare) ifFalse: [ ^ self ].

	"Vérifie si le mouvement est un déplacement de deux cases."
	hasJustMovedTwoSteps := self isInStartingPosition
        and: [ aSquare = (self isWhite ifTrue: [ square up up ] ifFalse: [ square down down ]) ].

	"Gestion de la prise en passant."
	(self canCaptureEnPassantOn: aSquare) ifTrue: [
		| capturedPawn |
		capturedPawn := self isWhite
			                ifTrue: [ aSquare down contents ]
			                ifFalse: [ aSquare up contents ].
		capturedPawn ifNotNil: [ capturedPawn square emptyContents ] ].

	"Déplace le pion normalement."
	square emptyContents.
	square := aSquare.
	aSquare contents: self
]

{ #category : 'rendering' }
MyPawn >> renderPieceOn: aSquare [ 
	
	^ aSquare renderPawn: self
]

{ #category : 'rendering' }
MyPawn >> targetSquaresLegal: aBoolean [

	| oneStep twoSteps diagLeft diagRight enPassantLeft enPassantRight moves |
	oneStep := self isWhite
		           ifTrue: [ square up ]
		           ifFalse: [ square down ].

	twoSteps := self isWhite
		            ifTrue: [ square up up ]
		            ifFalse: [ square down down ].

	diagLeft := self isWhite
		            ifTrue: [ square up left ]
		            ifFalse: [ square down right ].

	diagRight := self isWhite
		             ifTrue: [ square up right ]
		             ifFalse: [ square down left ].

	enPassantLeft := self isWhite
		                 ifTrue: [ square down left ]
		                 ifFalse: [ square up right ].

	enPassantRight := self isWhite
		                  ifTrue: [ square down right ]
		                  ifFalse: [ square up left ].

	moves := OrderedCollection new.

	(self canAdvanceTo: oneStep) ifTrue: [ moves add: oneStep ].

	(self isInStartingPosition and: [
		 (self canAdvanceTo: oneStep) and: [ self canAdvanceTo: twoSteps ] ])
		ifTrue: [ moves add: twoSteps ].

	(self isDiagonalMoveLegal: diagLeft) ifTrue: [ moves add: diagLeft ].

	(self isDiagonalMoveLegal: diagRight) ifTrue: [ moves add: diagRight ].

	(self canCaptureEnPassantOn: diagLeft) ifTrue: [ moves add: diagLeft ].

	(self canCaptureEnPassantOn: diagRight) ifTrue: [
		moves add: diagRight ].



	^ moves
]
