Class {
	#name : #REDCell,
	#superclass : #CMSpatialEntityElement,
	#category : #'RED-Model'
}

{ #category : #accessing }
REDCell class >> entityName [

	^ 'Cell'
]

{ #category : #pov }
REDCell >> pov [

	^ Color black
]
