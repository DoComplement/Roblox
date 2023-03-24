# Information
This is not a metatable

## Methods
`<return type> directory (<argument type> argument, ...)`<br /> <br />

```   
<table> rand.Alphabet(<bool> concat,<bool> rand)
```     
`returns table (tuple) of 64 characters corresponding to the system's alphabet`<br /><br />

```   
<table> rand.linear(<int> Length)
```   
`returns linear array where each the value at index i is equal to i`<br /><br />

```   
<table> rand.sequence(<int> Length)
```   
`returns a one-dimensional array with the indexes linear and the values random`<br /><br />
           
```   
<variant> rand.randomize(<variant (string/index-array)> Entity , <bool> Concat | nil)
```   
`returns the input, randomized, as a table, Concat = false or nil, or string, Concat = true`<br /><br />

```   
<string> rand.randStr(<int> Length)
``` 
`returns a random string`<br /><br />
 
