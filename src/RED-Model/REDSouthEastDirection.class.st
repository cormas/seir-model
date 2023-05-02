Class {
	#name : #REDSouthEastDirection,
	#superclass : #REDDirection,
	#category : #'RED-Model-Direction'
}

{ #category : #accessing }
REDSouthEastDirection >> moveForward [

	individual moveSE
]

{ #category : #'as yet unclassified' }
REDSouthEastDirection >> targetCell [
	"A cell to which we want to move"
	^ individual patch neighbourSE
]

{ #category : #'as yet unclassified' }
REDSouthEastDirection >> turnLeft [

	^ REDEastDirection forIndividual: individual
]

{ #category : #'as yet unclassified' }
REDSouthEastDirection >> turnRight [

	^ REDSouthDirection forIndividual: individual
]
