# Miscellaneous Constructs

<!-- TOC -->

- [1. Brackets](#1-brackets)
- [2. Curly Brackets](#2-curly-brackets)
- [3. Parentheses](#3-parentheses)
- [4. Double Parentheses](#4-double-parentheses)
- [5. Quoting](#5-quoting)
- [6. Back Quotes](#6-back-quotes)
- [Reference](#reference)

<!-- /TOC -->

## 1. Brackets

- `if [ CONDITION ]`: Test construct
- `if [[ CONDITION ]]`: Extended test construct
- `Array[1]=element1`: Array initialization
- `[a-z]`: Range of characters within a Regular Expression

## 2. Curly Brackets

- `${variable}`: Parameter substitution
- `${!variable}`: Indirect variable reference
- `{ command1; command2; . . . commandN; }`: Block of code
- `{string1,string2,string3,...}`: Brace expansion
- `{a..z}`: Extended brace expansion
- `{}`: Text replacement, after `find` and `xargs`

```bash
$ echo {a..z}
a b c d e f g h i j k l m n o p q r s t u v w x y z

$ echo {a,b,c}
a b c
```

## 3. Parentheses

- `( command1; command2 )`: Command group executed within a subshell
- `Array=(element1 element2 element3)`: Array initialization
- `result=$(COMMAND)`: Command substitution, new style
- `>(COMMAND)`: Process substitution
- `<(COMMAND)`: Process substitution

## 4. Double Parentheses

- `(( var = 78 ))`: Integer arithmetic
- `var=$(( 20 + 5 ))`: Integer arithmetic, with variable assignment
- `(( var++ ))`: C-style variable increment
- `(( var-- ))`: C-style variable decrement
- `(( var0 = var1<98?9:21 ))`: C-style ternary operation

## 5. Quoting

- `"$variable"`: "Weak" quoting
- `'string'`: 'Strong' quoting

## 6. Back Quotes

- result=`COMMAND`: Command substitution, classic style

## Reference

- [Reference Cards](http://tldp.org/LDP/abs/html/refcards.html)
