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
