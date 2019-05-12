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

{ #category : #private }
Question class >> rawTopicsToTopics: rawTopics [
  ^(rawTopics = '') ifTrue: [ Bag new ] ifFalse: [ (rawTopics splitOn: ',') asBag ]
]

{ #category : #'as yet unclassified' }
Question class >> withTitle: aTitle andUser: aUser andRawTopics: rawTopics andText: text [
	^self new title: aTitle; user: aUser; topics: (self rawTopicsToTopics: rawTopics); text: text; yourself
]

{ #category : #'as yet unclassified' }
Question class >> withTitle: aTitle andUser: aUser andTopics: topics andText: text [
	^self new title: aTitle; user: aUser; topics: topics; text: text; yourself
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

{ #category : #'as yet unclassified' }
Question >> answersByUser: anUser [
	^self answers select: [ :answer | answer user = anUser ].

]

{ #category : #accessing }
Question >> creation [
	^content creation
]

{ #category : #testing }
Question >> hasTopic: aTopic [
	^(self topics) anySatisfy: [ :topicName | topicName = aTopic name]
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
Question >> text: aText [
	content text: aText
]

{ #category : #accessing }
Question >> title [
	^ title
]

{ #category : #'private ' }
Question >> title: anObject [
	title := anObject
]

{ #category : #accessing }
Question >> topics [
	^topics 
]

{ #category : #'private ' }
Question >> topics: theTopics [
	topics := theTopics asBag
]

{ #category : #accessing }
Question >> user [
	^content user
]

{ #category : #accessing }
Question >> user: aUser [
	content user: aUser
]
