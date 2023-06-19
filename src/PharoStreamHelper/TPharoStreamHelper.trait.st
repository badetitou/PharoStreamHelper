Trait {
	#name : #TPharoStreamHelper,
	#instVars : [
		'currentWriteStream',
		'indentLevel',
		'indentNumber',
		'eolSeparator'
	],
	#category : #PharoStreamHelper
}

{ #category : #streaming }
TPharoStreamHelper >> << elements [

	self indent.
	currentWriteStream << elements
]

{ #category : #streaming }
TPharoStreamHelper >> <<< elements [

	self indent.
	currentWriteStream << elements
]

{ #category : #streaming }
TPharoStreamHelper >> <<<| elements [

	self <<< elements.
	self eol
]

{ #category : #streaming }
TPharoStreamHelper >> <<| elements [

	self << elements.
	self eol
]

{ #category : #streaming }
TPharoStreamHelper >> cr [

	^ self << String cr
]

{ #category : #streaming }
TPharoStreamHelper >> crlf [

	^ self << String crlf
]

{ #category : #streaming }
TPharoStreamHelper >> currentWriteStream [

	^ currentWriteStream
]

{ #category : #streaming }
TPharoStreamHelper >> currentWriteStream: anObject [

	currentWriteStream := anObject
]

{ #category : #streaming }
TPharoStreamHelper >> eol [

	^ self << self eolSeparator
]

{ #category : #streaming }
TPharoStreamHelper >> eolSeparator [

	^ eolSeparator ifNil: [ 
		  eolSeparator := OSPlatform current lineEnding ]
]

{ #category : #streaming }
TPharoStreamHelper >> eolSeparator: anObject [

	eolSeparator := anObject
]

{ #category : #streaming }
TPharoStreamHelper >> inBraces: aBlock [

	self
		<< '{';
		indentPlus;
		eol.
	aBlock value.
	self
		eol;
		indentMinus;
		<<< '}'
]

{ #category : #streaming }
TPharoStreamHelper >> inBrakets: aBlock [

	self
		<< '[';
		indentPlus;
		eol.
	aBlock value.
	self
		eol;
		indentMinus;
		<<< ']'
]

{ #category : #streaming }
TPharoStreamHelper >> inIndented: aBlock [

	self
		indentPlus;
		eol.
	aBlock value.
	self
		indentMinus;
		eol
]

{ #category : #streaming }
TPharoStreamHelper >> inParenthesis: aBlock [

	self << '('.
	aBlock value.
	self <<< ')'
]

{ #category : #streaming }
TPharoStreamHelper >> inParenthesisNoIndent: aBlock [

	self << '('.
	aBlock value.
	self << ')'
]

{ #category : #streaming }
TPharoStreamHelper >> indent [

	1 to: self indentLevel * self indentNumber do: [ :i | 
	currentWriteStream << self indentCharacter ]
]

{ #category : #streaming }
TPharoStreamHelper >> indentCharacter [

	^ String space
]

{ #category : #streaming }
TPharoStreamHelper >> indentLevel [

	^ indentLevel ifNil: [ indentLevel := 0 ]
]

{ #category : #streaming }
TPharoStreamHelper >> indentLevel: aLevel [

	indentLevel := aLevel
]

{ #category : #streaming }
TPharoStreamHelper >> indentMinus [

	self assert: indentLevel > 0.
	^ indentLevel := indentLevel - 1
]

{ #category : #streaming }
TPharoStreamHelper >> indentNumber [

	^ 4
]

{ #category : #streaming }
TPharoStreamHelper >> indentPlus [

	^ indentLevel := self indentLevel + 1
]

{ #category : #streaming }
TPharoStreamHelper >> space [

	^ self << $ 
]
