Class {
	#name : #REDSouthDirection,
	#superclass : #REDDirection,
	#category : #'RED-Model-Direction'
}

{ #category : #accessing }
REDSouthDirection >> moveForward [

	individual moveS
]

{ #category : #'as yet unclassified' }
REDSouthDirection >> targetCell [
	"A cell to which we want to move"
	^ individual patch neighbourS
]

{ #category : #'as yet unclassified' }
REDSouthDirection >> turnLeft [

	^ REDSouthEastDirection forIndividual: individual
]

{ #category : #'as yet unclassified' }
REDSouthDirection >> turnRight [

	^ REDSouthWestDirection forIndividual: individual
]
