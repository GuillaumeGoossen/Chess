Class {
	#name : 'MyPawn',
	#superclass : 'MyPiece',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'rendering' }
MyPawn >> canAdvanceTo: aSquare [
    "Vérifie si le pion peut avancer sur une case donnée."
    ^ aSquare notNil and: [ aSquare hasPiece not ].
]

{ #category : 'rendering' }
MyPawn >> canCaptureOn: aSquare [
	"Vérifie si le pion peut capturer une pièce sur une case donnée."
	^ (aSquare notNil and: [ aSquare hasPiece ]) and: [
		  aSquare contents color ~= self color ]
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
MyPawn >> renderPieceOn: aSquare [ 
	
	^ aSquare renderPawn: self
]

{ #category : 'rendering' }
MyPawn >> targetSquaresLegal: aBoolean [

    | oneStep twoSteps diagLeft diagRight moves |
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

    moves := OrderedCollection new.

    (self canAdvanceTo: oneStep)
        ifTrue: [ moves add: oneStep ].

    (self isInStartingPosition
        and: [ (self canAdvanceTo: oneStep) and: [ self canAdvanceTo: twoSteps ] ])
        ifTrue: [ moves add: twoSteps ].

    (self isDiagonalMoveLegal: diagLeft)
        ifTrue: [ moves add: diagLeft ].

    (self isDiagonalMoveLegal: diagRight)
        ifTrue: [ moves add: diagRight ].

    ^ moves.

]
