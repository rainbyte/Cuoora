"
Para usar ejecutar en playground: 

	WAAdmin register: #CuooraLogin asApplicationAt: 'cuoora'

Luego ir a la URL similar a:
	
	http://HOST:PORT/cuoora
	
URL de ejemplo:
	
	http://localhost:8080/cuoora
	
Ingresar con algunos de los usuarios predeterminados, ejemplo:

	User: pedro@cuoora.com
	Pass: pedro@cuoora.com

Para resetear el sistema de ejemplo, ejecutar:

	System resetInstanceToExample
"
Class {
	#name : #CuooraLogin,
	#superclass : #WAComponent,
	#instVars : [
		'username',
		'password'
	],
	#category : #'Practica1-Web'
}

{ #category : #'private protocol' }
CuooraLogin >> login [
	(System getInstance loginWithUsername: username andPassword: password)
		ifNotNil: [ :u | self call: (CuooraHome withUser: u). ]
]

{ #category : #accessing }
CuooraLogin >> password [
	^ password
]

{ #category : #accessing }
CuooraLogin >> password: anObject [
	password := anObject
]

{ #category : #rendering }
CuooraLogin >> renderContentOn: htmlCanvas [
	htmlCanvas form: [ 
		htmlCanvas text: 'Username: '.
		htmlCanvas textInput on: #username of: self.
		htmlCanvas break.
		htmlCanvas text: 'Password: '.
		htmlCanvas textInput on: #password of: self.
		htmlCanvas break.
		htmlCanvas submitButton
			callback: [ self login ];
			value: 'Login'.
	]
]

{ #category : #accessing }
CuooraLogin >> username [
	^ username
]

{ #category : #accessing }
CuooraLogin >> username: anObject [
	username := anObject
]
