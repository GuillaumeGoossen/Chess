Class {
	#name : 'MyChessSquareWhite',
	#superclass : 'MyChessSquare',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'accessing' }
MyChessSquareWhite >> emptySquareRepresentation [ 
	^ 'z'

]

{ #category : 'accessing' }
MyChessSquareWhite >> foreground [ 
	^ board whiteColor

]

{ #category : 'accessing' }
MyChessSquareWhite >> negatedColor [ 
	^ Color black

]

{ #category : 'rendering' }
MyChessSquareWhite >> renderBishopBlack [ 
	^ 'V'

]

{ #category : 'rendering' }
MyChessSquareWhite >> renderBishopWhite [ 
	^ 'B'
]

{ #category : 'rendering' }
MyChessSquareWhite >> renderKingBlack [
	^ 'L'
]

{ #category : 'rendering' }
MyChessSquareWhite >> renderKingWhite [
	^ 'K'
]

{ #category : 'rendering' }
MyChessSquareWhite >> renderKnightBlack [
	^ 'M'
]

{ #category : 'rendering' }
MyChessSquareWhite >> renderKnightWhite [
	^ 'N'
]

{ #category : 'rendering' }
MyChessSquareWhite >> renderPawnBlack [
	^ 'O'
]

{ #category : 'rendering' }
MyChessSquareWhite >> renderPawnWhite [
	^ 'P'
]

{ #category : 'rendering' }
MyChessSquareWhite >> renderQueenBlack [
	^ 'W'
]

{ #category : 'rendering' }
MyChessSquareWhite >> renderQueenWhite [
	^ 'Q'
]

{ #category : 'rendering' }
MyChessSquareWhite >> renderRookBlack [
	^ 'T'
]

{ #category : 'rendering' }
MyChessSquareWhite >> renderRookWhite [
	^ 'R'
]
