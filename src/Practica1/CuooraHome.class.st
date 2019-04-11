Class {
	#name : #CuooraHome,
	#superclass : #WAComponent,
	#instVars : [
		'user'
	],
	#category : #'Practica1-Web'
}

{ #category : #'as yet unclassified' }
CuooraHome class >> withUser: aUser [
	^ CuooraHome new _user: aUser; yourself 
]

{ #category : #accessing }
CuooraHome >> _user: aUser [
	user := aUser
]

{ #category : #initialization }
CuooraHome >> initialize [
	super initialize.
]

{ #category : #rendering }
CuooraHome >> renderContentOn: htmlCanvas [
	self renderHeader: htmlCanvas.
"	self renderLastQuestions: htmlCanvas."
]

{ #category : #rendering }
CuooraHome >> renderHeader: html [
	(html div)
		id: 'header';
		with: [
			html paragraph: [ 
				html render: 'CuOOra'.
				html render: ('{1}' format: {user name})
			]
		]
]

{ #category : #hooks }
CuooraHome >> style [
	^	'
		p { color: red };
	'
]
