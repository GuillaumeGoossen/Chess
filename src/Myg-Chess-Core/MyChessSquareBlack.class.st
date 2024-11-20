Class {
	#name : 'MyChessSquareBlack',
	#superclass : 'MyChessSquare',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'accessing' }
MyChessSquareBlack >> emptySquareRepresentation [ [
	^ 'x'
]
]

{ #category : 'accessing' }
MyChessSquareBlack >> foreground [ [
			
	^ board blackColor
]
]

{ #category : 'accessing' }
MyChessSquareBlack >> negatedColor [ [

	^ Color white
]
]

{ #category : 'rendering' }
MyChessSquareBlack >> renderBishop: aPiece [ [
    ^ aPiece isWhite ifTrue: ['b'] ifFalse: ['v']
]
]

{ #category : 'rendering' }
MyChessSquareBlack >> renderKing: aPiece [ [
    ^ aPiece isWhite ifFalse: ['l'] ifTrue: ['k']
]
]

{ #category : 'rendering' }
MyChessSquareBlack >> renderKnight: aPiece [ [
    ^ aPiece isWhite ifFalse: ['m'] ifTrue: ['n']
]
]

{ #category : 'rendering' }
MyChessSquareBlack >> renderPawn: aPiece [ [
    ^ aPiece isWhite ifFalse: ['o'] ifTrue: ['p']
]
]

{ #category : 'rendering' }
MyChessSquareBlack >> renderQueen: aPiece [ [
    ^ aPiece isWhite ifFalse: ['w'] ifTrue: ['q']
]
]

{ #category : 'rendering' }
MyChessSquareBlack >> renderRook: aPiece [ [
    ^ aPiece isWhite ifFalse: ['t'] ifTrue: ['r']
]
]
