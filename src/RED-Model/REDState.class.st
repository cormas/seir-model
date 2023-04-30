Class {
	#name : #REDState,
	#superclass : #Object,
	#instVars : [
		'individual',
		'dayCount'
	],
	#category : #'RED-Model'
}

{ #category : #'as yet unclassified' }
REDState class >> forIndividual: anIndividual [

	^ self new
		individual: anIndividual;
		yourself
]

{ #category : #accessing }
REDState >> color [

	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
REDState >> incrementDayCount [

	dayCount := dayCount + 1
]

{ #category : #accessing }
REDState >> individual: anIndividual [
	"State object needs to store the reference to the individual to which it belongs. This will alow it to check for other individuals in the neighbourhood"

	individual := anIndividual
]

{ #category : #initialization }
REDState >> initialize [

	super initialize.
	dayCount := 0.
]

{ #category : #testing }
REDState >> isExposed [

	^ false
]

{ #category : #testing }
REDState >> isInfectious [

	^ false
]

{ #category : #testing }
REDState >> isRecovered [

	^ false
]

{ #category : #testing }
REDState >> isSusceptible [

	^ false
]

{ #category : #accessing }
REDState >> newState [

	self subclassResponsibility
]
