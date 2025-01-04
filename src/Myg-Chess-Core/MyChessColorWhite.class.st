Class {
	#name : 'MyChessColorWhite',
	#superclass : 'MyChessColor',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'arithmetic' }
MyChessColorWhite >> color [ 
	^ Color white
]

{ #category : 'arithmetic' }
MyChessColorWhite >> negated [ 
	^ Color black
]

{ #category : 'arithmetic' }
MyChessColorWhite >> renderBishop: aSquare [
	^ aSquare renderBishopWhite
]

{ #category : 'arithmetic' }
MyChessColorWhite >> renderKing: aSquare [
	^ aSquare renderKingWhite
]

{ #category : 'arithmetic' }
MyChessColorWhite >> renderKnight: aSquare [
	^ aSquare renderKnightWhite
]

{ #category : 'arithmetic' }
MyChessColorWhite >> renderPawn: aSquare [
	^ aSquare renderPawnWhite
]

{ #category : 'arithmetic' }
MyChessColorWhite >> renderQueen: aSquare [
	^ aSquare renderQueenWhite
]

{ #category : 'arithmetic' }
MyChessColorWhite >> renderRook: aSquare [
	^ aSquare renderRookWhite
]
