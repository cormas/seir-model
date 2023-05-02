Class {
	#name : #REDDirection,
	#superclass : #Object,
	#instVars : [
		'individual'
	],
	#category : #'RED-Model-Direction'
}

{ #category : #'as yet unclassified' }
REDDirection class >> changeDirectionProbability [
	"The probability that an individual decides to randomply change the direction"
	^ 0.1
]

{ #category : #'as yet unclassified' }
REDDirection class >> forIndividual: anIndividual [

	^ self new
		individual: anIndividual;
		yourself.
]

{ #category : #'as yet unclassified' }
REDDirection class >> randomForIndividual: anIndividual [
	"Create an instance of a randomly selected direction"
	^ REDDirection subclasses atRandom
		forIndividual: anIndividual.
]

{ #category : #testing }
REDDirection >> canMoveForward [ 

	| target |
	target := self targetCell.
	^ target notNil "and: [ target noOccupant ]".
]

{ #category : #'as yet unclassified' }
REDDirection >> considerChangingDirection [
	
	^ Random new next < self class changeDirectionProbability
		ifTrue: [ self class randomForIndividual: individual ]
		ifFalse: [ self ]
]

{ #category : #accessing }
REDDirection >> individual: anIndividual [

	individual := anIndividual
]

{ #category : #'as yet unclassified' }
REDDirection >> moveForward [

	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
REDDirection >> targetCell [
	"A cell to which we want to move"
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
REDDirection >> turnLeft [

	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
REDDirection >> turnRandomly [

	"^ Random new next < 0.5
		ifTrue: [ self turnLeft ]
		ifFalse: [ self turnRight ]."
		
	^ self class randomForIndividual: individual
]

{ #category : #'as yet unclassified' }
REDDirection >> turnRight [

	self subclassResponsibility
]
