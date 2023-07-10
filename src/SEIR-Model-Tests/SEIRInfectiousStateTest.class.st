Class {
	#name : #SEIRInfectiousStateTest,
	#superclass : #SEIRStateTest,
	#category : #'SEIR-Model-Tests'
}

{ #category : #initialization }
SEIRInfectiousStateTest >> stateClass [

	^ SEIRInfectiousState
]

{ #category : #'as yet unclassified' }
SEIRInfectiousStateTest >> testIsInfectious [

	self assert: self state isInfectious 
]

{ #category : #tests }
SEIRInfectiousStateTest >> testNewState [

	(individual infectiousPeriod - 1) timesRepeat: [ 
		self assert: state newState isInfectious ].
	
	self assert: state newState isRecovered.

]
