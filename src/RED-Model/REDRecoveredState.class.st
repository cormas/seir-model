Class {
	#name : #REDRecoveredState,
	#superclass : #REDState,
	#category : #'RED-Model-State'
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

	self incrementDayCount.
	
	^ dayCount >= individual immunityPeriod
		ifTrue: [ REDSusceptibleState forIndividual: individual ]
		ifFalse: [ self ]
]
