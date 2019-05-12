Class {
	#name : #CuooraQuestion,
	#superclass : #WAComponent,
	#instVars : [
		'currentUser',
		'question'
	],
	#category : #'Practica1-Web'
}

{ #category : #'as yet unclassified' }
CuooraQuestion class >> withCurrentUser: anUser andQuestion: aQuestion [
	^CuooraQuestion new currentUser: anUser; question: aQuestion; yourself
]

{ #category : #'private ' }
CuooraQuestion >> currentUser: anUser [
	currentUser := anUser
]

{ #category : #'private ' }
CuooraQuestion >> question: aQuestion [
	question := aQuestion
]

{ #category : #'private ' }
CuooraQuestion >> renderAnswer: anAnswer withBrush: html [
	html div
		with: [
			html div
				class: 'answer-by';
				with: [ 
					html render: 'by '.
					html anchor
						callback: [ self call: (CuooraUserProfile withCurrentUser: currentUser andProfileUser: (anAnswer user)) ];
						with: ('{1}' format: {anAnswer user name}).
			  ].
			html div
				class: 'answer-content';
				with: [
					html paragraph: (anAnswer text).
				].
			html div
				class: 'answer-info';
				with: [
					html span
						with: [ 
							html render: ('created at {1} | {2} likes | {3} dislikes' format: {
								anAnswer creation asLocalStringYMDHM.
								anAnswer reactions count: [ :reaction | reaction emotion = #like ].
								anAnswer reactions count: [ :reaction | reaction emotion = #dislike ].
							}).
						]
				].
			html div
				class: 'answer-react';
				with: [
					html anchor
						callback: [ 
							| reaction |
							reaction := Reaction likeByUser: currentUser. 
							anAnswer addReaction: reaction. 
						];
						with: 'Like'.
					html render: ' | '.
					html anchor
						callback: [
							| reaction |
							reaction := Reaction dislikByUser: currentUser. 
							anAnswer addReaction: reaction. 
						];
						with: 'Dislike'.
				].
		]	
]

{ #category : #rendering }
CuooraQuestion >> renderContentOn: html [
	self renderHeaderOn: html.
	html horizontalRule.
	self renderQuestionOn: html.	
	html horizontalRule.
	self renderFooterOn: html.
]

{ #category : #'private ' }
CuooraQuestion >> renderFooterOn: html [
	html paragraph: 'No more answers'.
	html anchor
		callback: [ self call: (CuooraAddAnswer withCurrentUser: currentUser toQuestion: question) ];
		with: '(+) Answer this question'
]

{ #category : #'private ' }
CuooraQuestion >> renderHeaderOn: html [
	RenderingHelper renderHeaderViewByUser: currentUser inComponent: self usingBrush: html
]

{ #category : #'private ' }
CuooraQuestion >> renderQuestionOn: html [
	RenderingHelper renderQuestion: question viewByUser: currentUser inComponent: self usingBrush: html. 
	(question answers) do: [ :answer | self renderAnswer: answer withBrush: html ].
	
]

{ #category : #hooks }
CuooraQuestion >> style [
	^	RenderingHelper style
]
