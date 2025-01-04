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
