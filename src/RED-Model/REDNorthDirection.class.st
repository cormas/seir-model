Class {
	#name : #REDNorthDirection,
	#superclass : #REDDirection,
	#category : #'RED-Model-Direction'
}

{ #category : #accessing }
REDNorthDirection >> moveForward [

	individual moveN
]

{ #category : #'as yet unclassified' }
REDNorthDirection >> targetCell [
	"A cell to which we want to move"
	^ individual patch neighbourN
]

{ #category : #'as yet unclassified' }
REDNorthDirection >> turnLeft [

	^ REDNorthWestDirection forIndividual: individual
]

{ #category : #'as yet unclassified' }
REDNorthDirection >> turnRight [

	^ REDNorthEastDirection forIndividual: individual
]
