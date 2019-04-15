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

{ #category : #rendering }
CuooraHome >> _renderHeaderOn: html [
	RenderingHelper renderHeaderViewByUser: user inComponent: self usingBrush: html 
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
CuooraHome >> renderContentOn: html [
	self _renderHeaderOn: html.
	html horizontalRule.
	self renderLastQuestions: html.
]

{ #category : #rendering }
CuooraHome >> renderLastQuestions: html [
	html div
		id: 'content';
		with: [
			html anchor
				callback: [	self call: (CuooraAddQuestion withCurrentUser: user) ];
				with: '(+) New question'.
			html heading: 'Last questions'.
			((System getInstance) obtainQuestionsRelevantToUser: user sortedByDateTake: 5)
				do: [ :question | RenderingHelper renderQuestion: question viewByUser: user inComponent: self usingBrush: html ]
		].
]

{ #category : #hooks }
CuooraHome >> style [
	^	RenderingHelper style
]
