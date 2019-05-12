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
Content >> addReaction: aReaction [
	reactions detect: [ :r | r user = aReaction user ]
		ifFound: [ :r |
			(r emotion = aReaction emotion) ifFalse: [
				reactions remove: r.
				reactions add: aReaction
			]
		] 
		ifNone: [
			reactions add: aReaction
		] 
]

{ #category : #'as yet unclassified' }
Content >> countDislikes [
	^reactions count: [ :reaction | reaction emotion = #dislike ].
]

{ #category : #'as yet unclassified' }
Content >> countLikes [
	^reactions count: [ :reaction | reaction emotion = #like ].
]

{ #category : #accessing }
Content >> creation [
	^ creation
]

{ #category : #accessing }
Content >> creation: anObject [
	creation := anObject
]

{ #category : #initialization }
Content >> initialize [
	creation := DateAndTime now.
	reactions := Bag new.
	text := ''.
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
