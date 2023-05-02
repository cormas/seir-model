Class {
	#name : #REDEastDirection,
	#superclass : #REDDirection,
	#category : #'RED-Model-Direction'
}

{ #category : #accessing }
REDEastDirection >> moveForward [

	individual moveE
]

{ #category : #'as yet unclassified' }
REDEastDirection >> targetCell [
	"A cell to which we want to move"
	^ individual patch neighbourE
]

{ #category : #'as yet unclassified' }
REDEastDirection >> turnLeft [

	^ REDNorthEastDirection forIndividual: individual
]

{ #category : #'as yet unclassified' }
REDEastDirection >> turnRight [

	^ REDSouthEastDirection forIndividual: individual
]
