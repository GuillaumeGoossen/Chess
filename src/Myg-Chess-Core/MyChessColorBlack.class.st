Class {
	#name : 'MyChessColorBlack',
	#superclass : 'MyChessColor',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'arithmetic' }
MyChessColorBlack >> color [ 
	^ Color black
]

{ #category : 'arithmetic' }
MyChessColorBlack >> negated [ 
	^ Color white
]

{ #category : 'arithmetic' }
MyChessColorBlack >> renderBishop: aSquare [
	^ aSquare renderBishopBlack
]

{ #category : 'arithmetic' }
MyChessColorBlack >> renderKing: aSquare [
	^ aSquare renderKingBlack
]

{ #category : 'arithmetic' }
MyChessColorBlack >> renderKnight: aSquare [
	^ aSquare renderKnightBlack
]

{ #category : 'arithmetic' }
MyChessColorBlack >> renderPawn: aSquare [
	^ aSquare renderPawnBlack
]

{ #category : 'arithmetic' }
MyChessColorBlack >> renderQueen: aSquare [
	^ aSquare renderQueenBlack
]

{ #category : 'arithmetic' }
MyChessColorBlack >> renderRook: aSquare [
	^ aSquare renderRookBlack
]
