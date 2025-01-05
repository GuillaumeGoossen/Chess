Class {
	#name : 'MyChessSquareBlack',
	#superclass : 'MyChessSquare',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'accessing' }
MyChessSquareBlack >> emptySquareRepresentation [ 
	^ 'x'

]

{ #category : 'accessing' }
MyChessSquareBlack >> foreground [ 
	^ board blackColor
]

{ #category : 'accessing' }
MyChessSquareBlack >> negatedColor [ 
	^ Color white
]

{ #category : 'rendering' }
MyChessSquareBlack >> renderBishopBlack [
	^ 'v'

]

{ #category : 'rendering' }
MyChessSquareBlack >> renderBishopWhite [ 
	^ 'b'

]

{ #category : 'rendering' }
MyChessSquareBlack >> renderKingBlack [
	^ 'l'
]

{ #category : 'rendering' }
MyChessSquareBlack >> renderKingWhite [
	^ 'k'
]

{ #category : 'rendering' }
MyChessSquareBlack >> renderKnightBlack [
	^ 'm'
]

{ #category : 'rendering' }
MyChessSquareBlack >> renderKnightWhite [
	^ 'n'
]

{ #category : 'rendering' }
MyChessSquareBlack >> renderPawnBlack [
	^ 'o'
]

{ #category : 'rendering' }
MyChessSquareBlack >> renderPawnWhite [
	^ 'p'
]

{ #category : 'rendering' }
MyChessSquareBlack >> renderQueenBlack [
	^ 'w'
]

{ #category : 'rendering' }
MyChessSquareBlack >> renderQueenWhite [
	^ 'q'
]

{ #category : 'rendering' }
MyChessSquareBlack >> renderRookBlack [
	^ 't'
]

{ #category : 'rendering' }
MyChessSquareBlack >> renderRookWhite [
	^ 'r'
]
