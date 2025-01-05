# Sujet

Le sujet de ce travail pratique est disponible sur le dépôt GitHub suivant :  
[Chess - UnivLille-Meta](https://github.com/UnivLille-Meta/Chess)
### Importation du projet

Pour importer le projet, commencez par ouvrir une image **Pharo 12.0**, puis suivez les étapes ci-dessous :

1. **Ouvrir un playground**  
    Accédez à **Browse > Playground** pour ouvrir un espace de travail.
    
2. **Exécuter le code d'importation**  
    Dans le playground, saisissez et exécutez le code suivant :
    
    ```smalltalk
    Metacello new
        repository: 'github://GuillaumeGoossen/Chess:main';
        baseline: 'MygChess';
        onConflictUseLoaded;
        load.
    ```
### Exécution du projet

Une fois le projet importé, suivez ces instructions pour l'exécuter :

1. **Ouvrir un playground**  
    Si aucun playground n'est ouvert, accédez à **Browse > Playground** pour en créer un.
    
2. **Lancer le code d'exécution**  
    Dans le playground, exécutez le code suivant :
    
    ```smalltalk
    board := MyChessGame freshGame.
    board size: 800@600.
    space := BlSpace new.
    space root addChild: board.
    space pulse.
    space resizable: true.
    space show.
    ```

Une fois ces étapes effectuées, l'interface de jeu s'ouvrira, et vous pourrez interagir avec l'échiquier.

---

# Mon Choix de Kata Guillaume

J'ai choisi de travailler sur le kata : `Refactor piece rendering`. Ce kata m'a permis de pratiquer les techniques de refactorisation ainsi que d'explorer les concepts de **double dispatch** et **table dispatch**.

---

## Premières Modifications

### Tag : [Refactoring-Piece-Rendering-v1.0](https://github.com/GuillaumeGoossen/Chess/releases/tag/Refactoring-Piece-Rendering-v1.0)

### Création de `MyChessSquareBlack` et `MyChessSquareWhite`

En introduisant les classes `WhiteSquare` et `BlackSquare`, j'ai clarifié et structuré la logique de rendu des pièces d'échecs. Voici les objectifs et les étapes de cette première phase :

#### Objectif

L'objectif était de séparer la logique de rendu des pièces selon la couleur des cases (blanches ou noires) pour rendre le code plus modulaire et plus facile à maintenir.

#### Étapes réalisées

1. **Création des classes `WhiteSquare` et `BlackSquare`** :
    
    - Ces classes, héritant de `MyChessSquare`, représentent respectivement les cases blanches et noires.
2. **Ajout de méthodes spécifiques** :
    
    - Chaque classe propose des méthodes propres pour rendre les pièces. Par exemple :
        - `WhiteSquare >> renderKnight:` renvoie `'N'` pour un cavalier blanc et `'M'` pour un cavalier noir.
        - `BlackSquare >> renderKnight:` renvoie `'n'` pour un cavalier blanc et `'m'` pour un cavalier noir.
3. **Introduction de méthodes utilitaires** :
    
    - Des méthodes comme `emptySquareRepresentation`, `foreground` et `negatedColor` ont été ajoutées pour gérer les spécificités des cases blanches et noires.

#### Exemple de code

##### `ChessSquareWhite`

```smalltalk
ChessSquareWhite >> renderKnight: aPiece [
    ^ aPiece isWhite ifTrue: ['N'] ifFalse: ['M']
]

ChessSquareWhite >> renderBishop: aPiece [
    ^ aPiece isWhite ifTrue: ['B'] ifFalse: ['v']
]
```

##### `ChessSquareBlack`

```smalltalk
ChessSquareBlack >> renderKnight: aPiece [
    ^ aPiece isWhite ifTrue: ['n'] ifFalse: ['m']
]

ChessSquareBlack >> renderBishop: aPiece [
    ^ aPiece isWhite ifTrue: ['b'] ifFalse: ['v']
]
```

### Modifications dans `MyChessSquare`

Dans `MyChessSquare`, j'ai transformé les méthodes de rendu (par exemple `renderBishop:`) et d'accès aux couleurs (`foreground`, `negatedColor`) en responsabilités des sous-classes via `self subclassResponsibility`. Cela impose à `WhiteSquare` et `BlackSquare` de fournir leurs propres implémentations.

J'ai également appliqué le design pattern **Hook and Template**. La méthode `contents: aPiece` agit comme une méthode template, définissant l'algorithme général pour mettre à jour le contenu d'une case. La méthode `emptySquareRepresentation` fonctionne comme un hook pour personnaliser le comportement lorsque le contenu est `nil`.

---

## Secondes Modifications

### Tag : [Refactoring-Piece-Rendering-v2.0](https://github.com/GuillaumeGoossen/Chess/releases/tag/Refactoring-Piece-Rendering-v2.0)

Après ces premières modifications, j'ai rencontré quelques blocages. Je manquais d'idées nouvelles, hormis répéter le processus pour les autres pièces. Bien que cette solution soit envisageable, elle aurait allongé le temps de développement et augmenté considérablement le nombre de classes.

Lors de présentations de mes camarades, une alternative intéressante a été suggérée : le design pattern **Strategy**. J'ai donc tenté de l'implémenter pour séparer les comportements liés à la couleur des pièces (noir et blanc) de leur logique principale.

### 1. Classe `MyChessColor`

`MyChessColor` est une classe abstraite définissant les signatures des méthodes liées au rendu des pièces. Chaque méthode utilise `self subclassResponsibility`, forçant leur implémentation dans les sous-classes :

```smalltalk
MyChessColor >> renderBishop: aSquare
    self subclassResponsibility
```

#### Méthodes définies

- `renderBishop: aSquare`
- `renderKing: aSquare`
- `renderKnight: aSquare`
- `renderPawn: aSquare`
- `renderQueen: aSquare`
- `renderRook: aSquare`

### 2. Sous-classes `MyChessColorWhite` et `MyChessColorBlack`

Ces classes définissent les comportements spécifiques des pièces blanches et noires :

- **`MyChessColorWhite`** : Associe les pièces blanches à la couleur blanche (`color: Color white`).
- **`MyChessColorBlack`** : Gère les pièces noires avec leur propre logique.

Chaque méthode appelle une méthode spécifique sur un objet `aSquare` (par exemple, `renderBishopWhite` ou `renderBishopBlack`).

---

## Troisième Modification

### Refactorisation avec Double Dispatch

Après avoir introduit `MyChessColor`, `MyChessColorWhite` et `MyChessColorBlack`, j'ai continué à refactoriser les classes des pièces (`MyPiece` et ses sous-classes), les cases (`MyChessSquare`, `MyChessSquareBlack`, `MyChessSquareWhite`), ainsi que les couleurs.

### Ancien Code avec Conditions

Avant la refactorisation, les méthodes de rendu utilisaient des conditions pour déterminer la représentation des pièces. Exemple :

```smalltalk
MyKnight >> renderPieceOn: aSquare [
    ^ aSquare renderKnight: self
]
```

### Nouveau Code avec Double Dispatch

J'ai modifié la méthode `renderPieceOn:` pour déléguer la responsabilité à la classe de la couleur :

#### Dans les classes de pièces

```smalltalk
MyPawn >> renderPieceOn: aSquare [
    ^ self myChessColor renderPawn: aSquare
]
```

#### Dans les classes de couleurs

```smalltalk
MyChessColorBlack >> renderPawn: aSquare [
    ^ aSquare renderPawnBlack
]

MyChessColorWhite >> renderPawn: aSquare [
    ^ aSquare renderPawnWhite
]
```

#### Dans les classes de cases

```smalltalk
MyChessSquareBlack >> renderPawnBlack [
    ^ 'o'
]

MyChessSquareWhite >> renderPawnWhite [
    ^ 'p'
]
```

### Fonctionnement du Double Dispatch

1. **Premier Dispatch** : La méthode `renderPieceOn:` de la pièce appelle `renderPawn:` de l'objet couleur.
2. **Deuxième Dispatch** : La méthode `renderPawn:` de la couleur appelle une méthode spécifique sur l'objet case (`renderPawnBlack` ou `renderPawnWhite`).

Ce mécanisme permet de déterminer la représentation des pièces en fonction des types combinés de la couleur et de la case.

---

## Introspection

Ce projet m'a permis de mieux comprendre les concepts avancés de conception orientée objet, en particulier les design patterns comme **Strategy** et **Double Dispatch**. Cependant, la mise en œuvre du pattern Strategy a été particulièrement délicate. Bien que je pense avoir assimilé la théorie, j'ai rencontré des difficultés importantes lors de l'implémentation. Mon code semble cohérent, mais je n'ai pas réussi à finaliser cette approche.

Je pense que ce problème est en partie lié à un manque de rigueur dans mes tests. Une validation plus systématique des comportements aurait probablement permis d'identifier plus tôt les points bloquants.
  
  

# Dimos MOUSSED-WERNITZ

## Kata : Mouvements des pions

  

### Partie 1 : Écriture des tests et implémentation des mouvements de base

Tag : [Fix-Pawn-moves-V.1.0](https://github.com/GuillaumeGoossen/Chess/releases/tag/Fix-Pawn-moves-V.1.0)

Pour commencer, on sait que les pions avancent d'une case à la fois, sauf pour le premier mouvement. Pour s'assurer que ceci est bien implémenté, je vais faire des tests pour les déplacements de base.

Déplacement d'une case :  

  

Le test passe, donc pas de souci à ce niveau-là.

  

Déplacement de 2 cases si en position initiale :

  

Le test ne passe pas pour e4, il n'y a donc pas de déplacement de deux cases prévu pour les pions.

Pour la position initiale, j'ai personnellement pensé à faire une méthode `isInStartingPosition` qui s'occupe de retourner `True` si le pion est en rangée 2 en étant Blanc ou en rangée 7 en étant Noir.

Yacine, lui, avait pensé à récupérer les coordonnées une par une pour un pion. Louiza, elle, positionne un booléen pour savoir si c'est le premier mouvement ou non.

Voici donc ma méthode :

  

Fun fact : je ne comprenais pas pourquoi mon test ne passait pas. Puis en déboguant, je me suis aperçu que le problème venait bien de `isStarting` et que `file` ne retournait pas 2 ou 7 mais `$2` ou `$7` par exemple.

  

Ensuite, je me suis penché sur le mouvement diagonal des pions en cas de pion adverse disponible en diagonale gauche ou droite.

Pour cela, j'ai simplement ajouté mes variables de cases `diagRight` et `diagLeft` qui me permettent, en fonction de la couleur, de récupérer la case à cet endroit.

Pour la condition, je vérifie simplement qu'il y a bien une pièce de couleur différente de celle du `self` en diagonale. Si oui, alors on ajoute ce mouvement dans la panoplie des mouvements disponibles pour le pion.

  

À ce moment-là, ma méthode `targetSquaresLegal` ressemble à ceci :

```smalltalk

targetSquaresLegal: aBoolean

    | oneStep twoSteps diagLeft diagRight moves |

    oneStep := self isWhite

                   ifTrue: [ square up ]

                   ifFalse: [ square down ].

  

    twoSteps := self isWhite

                    ifTrue: [ square up up ]

                    ifFalse: [ square down down ].

  

    diagLeft := self isWhite

                    ifTrue: [ square up left ]

                    ifFalse: [ square down right ].

  

    diagRight := self isWhite

                     ifTrue: [ square up right ]

                     ifFalse: [ square down left ].

  

    moves := (oneStep notNil and: [ oneStep hasPiece not ])

                 ifTrue: [ { oneStep } ]

                 ifFalse: [ #(  ) ].

  

    self isInStartingPosition ifTrue: [ moves := moves , { twoSteps } ].

  

    (diagLeft notNil and: [ diagLeft hasPiece ]) ifTrue: [

        moves := moves , { diagLeft } ].

  

    (diagRight notNil and: [ diagRight hasPiece ]) ifTrue: [

        moves := moves , { diagRight } ].

  

    ^ moves select: [ :s |

          s hasPiece not or: [ s contents color ~= color ] ]

```

  
  

### Partie 2 : Petite refacto avant implémentation de la prise en passant

 Tag : [Fix-Pawn-moves-V.2.0](https://github.com/GuillaumeGoossen/Chess/releases/tag/Fix-Pawn-moves-V.2.0) 

Ensuite, il fallait que je m'attaque à la fameuse prise en passant.

Pour optimiser le tout, je me suis dit que je pouvais généraliser certains comportements dans des méthodes.

Voici donc 3 méthodes que j'ai faites :

  

```smalltalk

canAdvanceTo: aSquare

    "Vérifie si le pion peut avancer sur une case donnée."

    ^ aSquare notNil and: [ aSquare hasPiece not ].

  

canCaptureOn: aSquare

    "Vérifie si le pion peut capturer une pièce sur une case donnée."

    ^ (aSquare notNil

        and: [ aSquare hasPiece ])

        and: [ aSquare contents color ~= self color ].

  

isDiagonalMoveLegal: aSquare

    "Vérifie si un déplacement diagonal est possible pour une capture."

    ^ self canCaptureOn: aSquare.
```

### Partie 3 : Écriture des tests et implémentation de la prise en passant

  

Je commence alors par écrire mon test qui est le suivant :

```smalltalk 
| pawn enemyPawn board squares |

    board := MyChessBoard empty.

  

    "Placer un pion noir sur sa position initiale et le déplacer de deux cases."

    board at: 'd7' put: (enemyPawn := MyPawn black).

    enemyPawn moveTo: (board at: 'd5').

  

    "Placer un pion blanc à proximité."

    board at: 'e5' put: (pawn := MyPawn white).

  

    "Vérifier les cibles disponibles pour le pion blanc."

    squares := pawn targetSquares.

  

    "Vérifie qu'il n'y a qu'une seule cible en diagonale pour la prise en passant."

    self assert: (squares includes: (board at: 'd6')).

    self deny: (squares includes: (board at: 'f6')).

  

    "Vérifie que les mouvements possibles incluent la prise en passant et le déplacement vers l'avant."

    self

        assertCollection: squares

        includesAll: (#( d6 e6 ) collect: [ :name | board at: name ]).

  

    "Simuler la prise en passant."

    pawn moveTo: (board at: 'd6').

  

    "Vérifier que le plateau est correctement mis à jour."

    self assert: (board at: 'd6') contents = pawn.

    self assert: (board at: 'd5') contents isNil "Vérifie que la case d5 est vide."
```

    

Le test est bien sûr rouge.

Je commence alors par implémenter la prise en passant dans mon core.

Mon idée, pour l'instant, est toujours d'ajouter à la collection `moves` de `targetSquaresLegal` les mouvements possibles dans le cas d'une prise en passant :


```smalltalk
(self canCaptureEnPassantOn: diagLeft) ifTrue: [ moves add: diagLeft ].

  

    (self canCaptureEnPassantOn: diagRight) ifTrue: [

        moves add: diagRight ].
```
    



  

Je fais alors cette méthode qui vérifie si on peut faire la prise sur une case donnée :


```smalltalk
canCaptureEnPassantOn: aSquare

    "Vérifie si le pion peut capturer en passant sur une case donnée."

  

    ^ (aSquare notNil and: [ "La case cible est vide."

           aSquare hasPiece not ]) and: [

          | adjacentPawn |

          adjacentPawn := self isWhite

                              ifTrue: [

                              square left contents ifNil: [

                                  square right contents ] ]

                              ifFalse: [

                              square right contents ifNil: [

                                  square left contents ] ].

          ((adjacentPawn notNil and: [ adjacentPawn isPawn ]) and: [

               adjacentPawn color ~= self color ]) and: [

              adjacentPawn hasJustMovedTwoSteps ] ]
```




  

J'ai donc décidé, pour savoir quand l'adversaire avait fait ses deux pas, de rajouter une variable d'instance `hasJustMovedTwoSteps` que je pourrais mettre à jour dans `moveTo:` comme ceci :

  


```smalltalk
"Vérifie si le mouvement est un déplacement de deux cases."

    hasJustMovedTwoSteps := self isInStartingPosition and: [

                                aSquare = (self isWhite

                                     ifTrue: [ square up up ]

                                     ifFalse: [ square down down ]) ].
```




  

J'en profite donc pour gérer en plus le pion mangé dans `moveTo:` :

  

```smalltalk

"Gestion de la prise en passant."

    (self canCaptureEnPassantOn: aSquare) ifTrue: [

        | capturedPawn |

        capturedPawn := self isWhite

                            ifTrue: [ aSquare down contents ]

                            ifFalse: [ aSquare up contents ].

        capturedPawn ifNotNil: [ capturedPawn square emptyContents ] ].

```

  

Je lance alors mon test... mais : test *orange*.

Il détecte bien qu'il peut faire la prise en passant mais renvoie `true` pour `diagLeft` et `diagRight`. Je dois alors changer ma méthode `canCaptureEnPassantOn:`.

Après avoir galéré à comprendre pourquoi il laissait passer les deux, j'ai enfin compris qu'au lieu de vérifier `square left` et `square right` indépendamment, il fallait vérifier seulement la case directement en lien avec `aSquare`. Je change donc ma méthode comme ceci :

  

```smalltalk

canCaptureEnPassantOn: aSquare

    "Vérifie si le pion peut capturer en passant sur une case donnée."

  

    ^ (aSquare notNil and: [ "La case cible est vide."

           aSquare hasPiece not ]) and: [

          | adjacentPawn |

            "On prends maintenant la position de aSquare par rapport à la colonne actuelle du pion"

          adjacentPawn := aSquare column < square column

                              ifTrue: [ square left contents ]

                              ifFalse: [ square right contents ].

          ((adjacentPawn notNil and: [ adjacentPawn isPawn ]) and: [

               adjacentPawn color ~= self color ]) and: [

              adjacentPawn hasJustMovedTwoSteps ] ]

```

  

De plus, je trouve que c'est plus lisible.

Mon test passe alors finalement au *VERT*.

Cela veut dire que le plateau est donc aussi bien mis à jour.

Maintenant que j'ai tous mes tests au vert, je décide de tester le tout directement *in game* en lançant le jeu sur mon Playground.

Je vois que toutes les fonctionnalités que j'ai ajoutées sont correctement implémentées. Cependant, je repère un problème.

En avançant un pion en bordure de plateau, j'ai une erreur qui se lance à cause de ma méthode `canCaptureEnPassantOn`, qui pouvait appeler le message `contents` même si la case était `Nil`.

J'ai donc ajouté une vérification `ifNotNil` et cela a fonctionné :

  

```smalltalk

| adjacentPawn |

          adjacentPawn := aSquare column < square column

                      ifTrue: [ square left ifNotNil: [ square left contents ] ]

                         ifFalse: [ square right ifNotNil: [ square right contents ] ].

```

Comme quoi, même après les tests, rien de tel que de la vérification en dur.

# Mise en commun 

La projet Chess est mis en commun est fonctionnelle dans le main cependant la partie Strategy mis en place dans la branche `Refactor-piece-rendering` n'a pas été merge car n'étant pas fonctionnelle.

 Tag : [Mise-en-commun-V.1.0](https://github.com/GuillaumeGoossen/Chess/tree/Mise-en-commun-V.1.0)