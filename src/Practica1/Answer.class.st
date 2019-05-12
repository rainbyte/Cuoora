Class {
	#name : #Answer,
	#superclass : #Object,
	#instVars : [
		'content'
	],
	#category : #'Practica1-Core'
}

{ #category : #'as yet unclassified' }
Answer class >> withUser: aUser andText: text [
	^self new user: aUser; text: text; yourself
]

{ #category : #adding }
Answer >> addReaction: aReaction [
	content addReaction: aReaction
]

{ #category : #accessing }
Answer >> creation [
	^content creation
]

{ #category : #initialization }
Answer >> initialize [
	content := Content new.
	
]

{ #category : #accessing }
Answer >> reactions [
	^content reactions 
]

{ #category : #accessing }
Answer >> text [
	^content text
]

{ #category : #'private ' }
Answer >> text: aText [
	content text: aText
]

{ #category : #accessing }
Answer >> user [
	^content user
]

{ #category : #accessing }
Answer >> user: anUser [
	content user: anUser
]
