Class {
	#name : #REDNorthWestDirection,
	#superclass : #REDDirection,
	#category : #'RED-Model-Direction'
}

{ #category : #accessing }
REDNorthWestDirection >> moveForward [

	individual moveNW
]

{ #category : #'as yet unclassified' }
REDNorthWestDirection >> targetCell [
	"A cell to which we want to move"
	^ individual patch neighbourNW
]

{ #category : #'as yet unclassified' }
REDNorthWestDirection >> turnLeft [

	^ REDWestDirection forIndividual: individual
]

{ #category : #'as yet unclassified' }
REDNorthWestDirection >> turnRight [

	^ REDNorthDirection forIndividual: individual
]
