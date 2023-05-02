Class {
	#name : #REDNorthEastDirection,
	#superclass : #REDDirection,
	#category : #'RED-Model-Direction'
}

{ #category : #accessing }
REDNorthEastDirection >> moveForward [

	individual moveNE
]

{ #category : #'as yet unclassified' }
REDNorthEastDirection >> targetCell [
	"A cell to which we want to move"
	^ individual patch neighbourNE
]

{ #category : #'as yet unclassified' }
REDNorthEastDirection >> turnLeft [

	^ REDNorthDirection forIndividual: individual
]

{ #category : #'as yet unclassified' }
REDNorthEastDirection >> turnRight [

	^ REDEastDirection forIndividual: individual
]
