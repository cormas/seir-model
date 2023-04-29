Class {
	#name : #REDSusceptibleState,
	#superclass : #REDState,
	#category : #'RED-Model'
}

{ #category : #accessing }
REDSusceptibleState >> color [

	^ Color gray
]

{ #category : #testing }
REDSusceptibleState >> isSusceptible [

	^ true
]

{ #category : #'instance creation' }
REDSusceptibleState >> newState [

	^ REDExposedState new
]
