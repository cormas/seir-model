Class {
	#name : #REDWestDirection,
	#superclass : #REDDirection,
	#category : #'RED-Model-Direction'
}

{ #category : #accessing }
REDWestDirection >> moveForward [

	individual moveW
]

{ #category : #'as yet unclassified' }
REDWestDirection >> targetCell [
	"A cell to which we want to move"
	^ individual patch neighbourW
]

{ #category : #'as yet unclassified' }
REDWestDirection >> turnLeft [

	^ REDSouthWestDirection forIndividual: individual
]

{ #category : #'as yet unclassified' }
REDWestDirection >> turnRight [

	^ REDNorthWestDirection forIndividual: individual
]
