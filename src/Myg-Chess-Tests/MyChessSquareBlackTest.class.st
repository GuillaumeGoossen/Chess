Class {
	#name : 'MyChessSquareBlackTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyChessSquareBlackTest >> testContentsWithBlackPiece [ 

    | squareTest blackPiece expectedText |

    "Création d'une case"
    squareTest := MyChessSquareBlack new.

    "Création d'une pièce noire"
    blackPiece := MyBishop black.

    "Test de l'ajout d'une pièce noire sur la case"
    squareTest contents: blackPiece.
    self assert: (squareTest contents) equals: blackPiece.

    "Vérification que le texte affiché est le rendu de la pièce noire"
    expectedText := blackPiece renderPieceOn: squareTest.
    self assert: (squareTest piece text) equals: (expectedText asRopedText
                                                    fontSize: 48;
                                                    foreground: squareTest foreground;
                                                    fontName: MyOpenChessDownloadedFont new familyName).

]

{ #category : 'tests' }
MyChessSquareBlackTest >> testContentsWithNil [ 

    | squareTest expectedText |

    "Création d'une case"
    squareTest := MyChessSquare new.

    "Test de l'absence de pièce sur la case"
    squareTest contents: nil.
    self assert: squareTest contents isNil.

    "Vérification que le texte affiché est la représentation d'une case vide"
    expectedText := squareTest emptySquareRepresentation.
    self assert: (squareTest piece text) equals: (expectedText asRopedText
                                                    fontSize: 48;
                                                    foreground: squareTest foreground;
                                                    fontName: MyOpenChessDownloadedFont new familyName).

]

{ #category : 'tests' }
MyChessSquareBlackTest >> testContentsWithWhitePiece [ 

    | squareTest whitePiece expectedText |

    "Création d'une case"
    squareTest := MyChessSquare new.

    "Création d'une pièce blanche"
    whitePiece := MyBishop white.

    "Test de l'ajout d'une pièce blanche sur la case"
    squareTest contents: whitePiece.
    self assert: (squareTest contents) equals: whitePiece.

    "Vérification que le texte affiché est le rendu de la pièce blanche"
    expectedText := whitePiece renderPieceOn: squareTest.
    self assert: (squareTest piece text) equals: (expectedText asRopedText
                                                    fontSize: 48;
                                                    foreground: squareTest foreground;
                                                    fontName: MyOpenChessDownloadedFont new familyName).

]
