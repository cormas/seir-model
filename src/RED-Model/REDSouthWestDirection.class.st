Class {
	#name : #REDSouthWestDirection,
	#superclass : #REDDirection,
	#category : #'RED-Model-Direction'
}

{ #category : #accessing }
REDSouthWestDirection >> moveForward [

	individual moveSW
]

{ #category : #'as yet unclassified' }
REDSouthWestDirection >> targetCell [
	"A cell to which we want to move"
	^ individual patch neighbourSW
]

{ #category : #'as yet unclassified' }
REDSouthWestDirection >> turnLeft [

	^ REDSouthDirection forIndividual: individual
]

{ #category : #'as yet unclassified' }
REDSouthWestDirection >> turnRight [

	^ REDWestDirection forIndividual: individual
]
