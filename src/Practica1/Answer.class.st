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
	^self new _user: aUser; _text: text; yourself
]

{ #category : #accessing }
Answer >> _text: aText [
	content text: aText
]

{ #category : #accessing }
Answer >> _user: anUser [
	content user: anUser
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

{ #category : #accessing }
Answer >> user [
	^content user
]
