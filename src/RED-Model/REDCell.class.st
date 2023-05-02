Class {
	#name : #REDCell,
	#superclass : #CMSpatialEntityElement,
	#category : #'RED-Model-Core'
}

{ #category : #accessing }
REDCell class >> entityName [

	^ 'Cell'
]

{ #category : #pov }
REDCell >> pov [

	^ Color black
]
