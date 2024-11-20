Class {
	#name : 'MyChessSquareWhite',
	#superclass : 'MyChessSquare',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'accessing' }
MyChessSquareWhite >> emptySquareRepresentation [ [
	^ 'z'
]
]

{ #category : 'accessing' }
MyChessSquareWhite >> foreground [ [
	^ board whiteColor
]
]

{ #category : 'accessing' }
MyChessSquareWhite >> negatedColor [ [
	^ Color black
]
]

{ #category : 'rendering' }
MyChessSquareWhite >> renderBishop: aPiece [ [
    ^ aPiece isWhite ifTrue: ['B'] ifFalse: ['v']
]
]

{ #category : 'rendering' }
MyChessSquareWhite >> renderKing: aPiece [ [
    ^ aPiece isWhite ifFalse: ['L'] ifTrue: ['K']
]
]

{ #category : 'rendering' }
MyChessSquareWhite >> renderKnight: aPiece [ [
    ^ aPiece isWhite ifFalse: ['M'] ifTrue: ['N']
]
]

{ #category : 'rendering' }
MyChessSquareWhite >> renderPawn: aPiece [ [
    ^ aPiece isWhite ifFalse: ['O'] ifTrue: ['P']
]
]

{ #category : 'rendering' }
MyChessSquareWhite >> renderQueen: aPiece [ [
    ^ aPiece isWhite ifFalse: ['W'] ifTrue: ['Q']
]
]

{ #category : 'rendering' }
MyChessSquareWhite >> renderRook: aPiece [ [
    ^ aPiece isWhite ifFalse: ['T'] ifTrue: ['R']
]
]
