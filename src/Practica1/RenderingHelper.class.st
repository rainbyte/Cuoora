Class {
	#name : #RenderingHelper,
	#superclass : #Object,
	#category : #'Practica1-Web'
}

{ #category : #rendering }
RenderingHelper class >> renderHeaderViewByUser: anUser inComponent: aComponent usingBrush: html [
	html div
		id: 'header';
		with: [
			html div
				id: 'header-left';
				with: [ html paragraph: 'CuOOra' ].
			html div
				id: 'header-right';
				with: [
					html paragraph: ('User "{1}"' format: {anUser name}).
					html anchor
						callback: [ aComponent call: (CuooraLogin new) ];
						with: 'Log out'.
				].
		]

]

{ #category : #rendering }
RenderingHelper class >> renderQuestion: question viewByUser: user inComponent: component usingBrush: html [
					html div
						with: [
							html anchor
								callback: [ component call: (CuooraQuestion withCurrentUser: user andQuestion: question) ];
								with: [
									html paragraph: (question title).
								].
							html div
								class: 'question-topics';
								with: [
									html render: 'Topics: '.
									(question topics) do: [ :topic | html span: topic ].
								].
							html div
								class: 'question-info';
								with: [
									html span
										with: [ 
											html render: 'by '.
											html anchor
												callback: [ component call: (CuooraUserProfile withCurrentUser: user andProfileUser: (question user)) ];
												with: ('{1}' format: {question user name}).
											html render: (' | at {1} | {2} answers | {3} likes | {4} dislikes' format: {
												question creation asLocalStringYMDHM.
												question answers size.
												question reactions count: [ :reaction | reaction emotion = Emotion like ].
												question reactions count: [ :reaction | reaction emotion = Emotion dislike ].
											}).
										]
								].
							html div
								class: 'question-react';
								with: [
									html anchor
										callback: [ 
											| reaction |
											reaction := Reaction fromUser: user withEmotion: Emotion like. 
											question addReaction: reaction. 
										];
										with: 'Like'.
									html render: ' | '.
									html anchor
										callback: [
											| reaction |
											reaction := Reaction fromUser: user withEmotion: Emotion dislike. 
											question addReaction: reaction. 
										];
										with: 'Dislike'.
								].
					  ]
]

{ #category : #hooks }
RenderingHelper class >> style [
	^	'
		p {
			color: red;
		}
		#header {
			display: flex;
			flex-direction: row;
			justify-content: space-between;
		}
		#header-right {
			display: flex;
			align-items: baseline;
		}
		#header-right a {
			padding-left: 10px;
		}
		.question-topics span {
			padding-left: 10px;
		}
	'
]
