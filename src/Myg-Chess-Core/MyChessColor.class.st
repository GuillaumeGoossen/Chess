Class {
	#name : 'MyChessColor',
	#superclass : 'Object',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'arithmetic' }
MyChessColor >> color [
	self subclassResponsibility 
]

{ #category : 'arithmetic' }
MyChessColor >> negated [
	self subclassResponsibility 
]

{ #category : 'arithmetic' }
MyChessColor >> renderBishop: aSquare [
	self subclassResponsibility 
]

{ #category : 'arithmetic' }
MyChessColor >> renderKing: aSquare [ 
	self subclassResponsibility
]

{ #category : 'arithmetic' }
MyChessColor >> renderKnight: aSquare [ 
	self subclassResponsibility
]

{ #category : 'arithmetic' }
MyChessColor >> renderPawn: aSquare [ 
	self subclassResponsibility
]

{ #category : 'arithmetic' }
MyChessColor >> renderQueen: aSquare [ 
	self subclassResponsibility
]

{ #category : 'arithmetic' }
MyChessColor >> renderRook: aSquare [ 
	self subclassResponsibility
]
