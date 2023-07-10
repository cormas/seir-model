Class {
	#name : #SEIRState,
	#superclass : #Object,
	#instVars : [
		'individual',
		'dayCount'
	],
	#category : #'SEIR-Model-State'
}

{ #category : #'as yet unclassified' }
SEIRState class >> forIndividual: anIndividual [

	^ self new
		individual: anIndividual;
		yourself
]

{ #category : #accessing }
SEIRState >> color [

	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
SEIRState >> incrementDayCount [

	dayCount := dayCount + 1
]

{ #category : #accessing }
SEIRState >> individual: anIndividual [
	"State object needs to store the reference to the individual to which it belongs. This will alow it to check for other individuals in the neighbourhood"

	individual := anIndividual
]

{ #category : #initialization }
SEIRState >> initialize [

	super initialize.
	dayCount := 0.
]

{ #category : #testing }
SEIRState >> isExposed [

	^ false
]

{ #category : #testing }
SEIRState >> isInfectious [

	^ false
]

{ #category : #testing }
SEIRState >> isRecovered [

	^ false
]

{ #category : #testing }
SEIRState >> isSusceptible [

	^ false
]

{ #category : #accessing }
SEIRState >> newState [

	self subclassResponsibility
]
