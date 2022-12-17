# Information
- Stuff goes here

## Methods
`<return type> directory (<argument type> argument, ...)`<br /> <br />

```   
<table> rand.AlphaBET 
```     
`returns table (tuple) of 64 characters corresponding to the system's alphabet`<br />

```   
<table> rand:createLinearTable(<int> Length)
```   
`returns linear array where each the value at index i is equal to i`<br />

```   
<table> rand:randSequence(<int> Length)
```   
`returns a one-dimensional array with the indexes linear and the values random`<br />  
           
```   
<variant> rand:Randomize(<variant (string/index-array)> Entity , <bool> Concat | nil)
```   
`returns the input, randomized, as a table, Concat = false or nil, or string, Concat = true`<br />

```   
<string> rand:randString(<int> Length)
``` 
`returns a random string`<br />
   
```   
<void> rand:updateAlphabet(<void>)
```   
`randomizes the internal Alphabet`<br />  

## To do
