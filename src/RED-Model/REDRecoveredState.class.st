Class {
	#name : #REDRecoveredState,
	#superclass : #REDState,
	#category : #'RED-Model'
}

{ #category : #accessing }
REDRecoveredState >> color [

	^ Color green
]

{ #category : #testing }
REDRecoveredState >> isRecovered [

	^ true
]

{ #category : #'instance creation' }
REDRecoveredState >> newState [

	^ REDSusceptibleState forIndividual: individual
]
