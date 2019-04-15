Class {
	#name : #Question,
	#superclass : #Object,
	#instVars : [
		'title',
		'topics',
		'answers',
		'content'
	],
	#category : #'Practica1-Core'
}

{ #category : #'as yet unclassified' }
Question class >> withTitle: aTitle andUser: aUser andTopics: topics andText: text [
	^self new _title: aTitle; _user: aUser; _topics: topics; _text: text; yourself
]

{ #category : #accessing }
Question >> _text: aText [
	content text: aText
]

{ #category : #accessing }
Question >> _title: anObject [
	title := anObject
]

{ #category : #accessing }
Question >> _topics: theTopics [
	topics := theTopics
]

{ #category : #accessing }
Question >> _user: aUser [
	content user: aUser
]

{ #category : #adding }
Question >> addAnswer: anAnswer [
	answers add: anAnswer
]

{ #category : #adding }
Question >> addReaction: aReaction [
	content addReaction: aReaction
]

{ #category : #accessing }
Question >> answers [
	^answers
]

{ #category : #accessing }
Question >> creation [
	^content creation
]

{ #category : #initialization }
Question >> initialize [
	title := ''.
	topics := Bag new.
	answers := Bag new.
	content := Content new.
	
]

{ #category : #testing }
Question >> isRelevantToUser: user [
	| hasTopic hasFollow |
	hasTopic := topics anySatisfy: [ :t | user topics includes: t ].
	hasFollow := user followList includes: (self user).
	^(hasTopic or: hasFollow)
]

{ #category : #accessing }
Question >> reactions [
	^content reactions 
]

{ #category : #accessing }
Question >> title [
	^ title
]

{ #category : #accessing }
Question >> topics [
	^topics 
]

{ #category : #accessing }
Question >> user [
	^content user
]
