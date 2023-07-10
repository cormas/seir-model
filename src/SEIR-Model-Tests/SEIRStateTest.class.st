Class {
	#name : #SEIRStateTest,
	#superclass : #TestCase,
	#instVars : [
		'individual',
		'state'
	],
	#category : #'SEIR-Model-Tests'
}

{ #category : #testing }
SEIRStateTest class >> isAbstract [

	^ self = SEIRStateTest
]

{ #category : #testing }
SEIRStateTest class >> shouldInheritSelectors [

	^ true
]

{ #category : #initialization }
SEIRStateTest >> setUp [
	
	| fixture |
	super setUp.
	
	fixture := SEIRModelFixture new.
	individual := fixture individual.
	state := self stateClass forIndividual: individual.
	
	individual incubationPeriod: 3.
	individual infectiousPeriod: 40.
	individual immunityPeriod: 100.
]

{ #category : #accessing }
SEIRStateTest >> state [

	^ state
]

{ #category : #initialization }
SEIRStateTest >> stateClass [

	self subclassResponsibility
]

{ #category : #tests }
SEIRStateTest >> testColor [

	self assert: (self state color isKindOf: Color)
]

{ #category : #tests }
SEIRStateTest >> testIsExposed [

	self deny: self state isExposed
]

{ #category : #tests }
SEIRStateTest >> testIsInfectious [

	self deny: self state isInfectious 
]

{ #category : #tests }
SEIRStateTest >> testIsRecovered [

	self deny: self state isRecovered
]

{ #category : #tests }
SEIRStateTest >> testIsSusceptible [

	self deny: self state isSusceptible
]

{ #category : #'instance creation' }
SEIRStateTest >> testNewState [

	self subclassResponsibility
]
