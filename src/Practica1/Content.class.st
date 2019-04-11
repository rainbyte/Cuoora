Class {
	#name : #Content,
	#superclass : #Object,
	#instVars : [
		'text',
		'user',
		'creation',
		'reactions'
	],
	#category : #'Practica1-Core'
}

{ #category : #accessing }
Content >> creation [
	^ creation
]

{ #category : #accessing }
Content >> creation: anObject [
	creation := anObject
]

{ #category : #accessing }
Content >> reactions [
	^ reactions
]

{ #category : #accessing }
Content >> reactions: anObject [
	reactions := anObject
]

{ #category : #accessing }
Content >> text [
	^ text
]

{ #category : #accessing }
Content >> text: anObject [
	text := anObject
]

{ #category : #accessing }
Content >> user [
	^user
]

{ #category : #accessing }
Content >> user: anObject [
	user := anObject
]
