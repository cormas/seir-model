Class {
	#name : #REDSusceptibleStateTest,
	#superclass : #REDStateTest,
	#category : #'RED-Model-Tests'
}

{ #category : #initialization }
REDSusceptibleStateTest >> stateClass [

	^ REDSusceptibleState
]

{ #category : #'as yet unclassified' }
REDSusceptibleStateTest >> testIsSusceptible [

	self assert: self state isSusceptible
]
