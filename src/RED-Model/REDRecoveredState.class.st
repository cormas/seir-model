Class {
	#name : #REDRecoveredState,
	#superclass : #REDState,
	#category : #'RED-Model-State'
}

{ #category : #accessing }
REDRecoveredState >> color [

	^ Color r: 0.19941348973607037 g: 0.6265884652981427 b: 0.17204301075268819 alpha: 1.0
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
