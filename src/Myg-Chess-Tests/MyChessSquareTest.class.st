Class {
	#name : 'MyChessSquareTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyChessSquareTest >> testRenderKnight [ [
    | square knightWhite knightBlack |
    
    "Créer une case blanche et noire"
    square := MyChessSquare new.
    square color: Color white.
    
    "Créer un cavalier blanc"
    knightWhite := MyKnight new.
    knightWhite color: Color white.
    
    "Vérifier le rendu du cavalier blanc sur une case blanche"
    self assert: (square renderPiece: knightWhite) equals: 'N'.
    
    "Changer la couleur de la case en noir"
    square color: Color black.
    
    "Vérifier le rendu du cavalier blanc sur une case noire"
    self assert: (square renderPiece: knightWhite) equals: 'n'.
    
    "Créer un cavalier noir"
    knightBlack := MyKnight new.
    knightBlack color: Color black.
    
    "Vérifier le rendu du cavalier noir sur une case blanche"
    square color: Color white.
    self assert: (square renderPiece: knightBlack) equals: 'M'.
    
    "Vérifier le rendu du cavalier noir sur une case noire"
    square color: Color black.
    self assert: (square renderPiece: knightBlack) equals: 'm'.
]
]
