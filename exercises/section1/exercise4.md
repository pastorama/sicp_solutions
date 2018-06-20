# Exercise 1.4


## Task

Observe that our model of evaluation allows for combinations whose operators are
compound expressions. Use this observation to describe the behavior of the following procedure:

```scheme
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))
```

## Solution

Use substition model to reason about expression `((if (> b 0) + -) a b))`
Since operator is evaluated too expression `(if (> b 0) + -)` is evaluated first
and after that is substitued in first expression. To do this let's evaluate combination `(a-plus-abs-b 10 5)`

First we need to substitute procedure name with its body and variables with same named args:

`((if (> 5 0) + -) 10 5)`

Then evaluated nested combinations:

`(if (> 5 0) + -) ; => (if true + -) => +`

Now go back to previous expression with substituted operator:

`(+ 10 5)`

And we get `15`

Lets evaluate `(a-plus-abs-b 10 (- 5))`

```scheme
((if (> (-5 0) + -) 10 (- 5)))
(- 10 (- 5))
15
```