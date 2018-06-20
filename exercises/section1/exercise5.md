# Exercise 1.5

## Task

Ben Bitdiddle has invented a test to determine whether the interpreter he is faced with is
using applicative-order evaluation or normal-order evaluation. He defines the following two
procedures:

```scheme
(define (p) (p))
(define (test x y)
  (if (= x 0)
    0
    y))
```

Then he evaluates the expression
```scheme
(test 0 (p))
```

What behavior will Ben observe with an interpreter that uses applicative-order evaluation? What
behavior will he observe with an interpreter that uses normal-order evaluation? Explain your answer.
(Assume that the evaluation rule for the special form if is the same whether the interpreter is using
normal or applicative order: The predicate expression is evaluated first, and the result determines
whether to evaluate the consequent or the alternative expression.)

## Solution

Let's explore behavior of procedure `p`. As we can see the procedure is defined in terms of itself, which means it recursive, but there's
no any case analysis there, so when `p` is called it call's itself, which do it again, and again, and after all program gets stuck in 
endless loop.

Now let's get to the difference between normal order and applicative order. In processes with normal order of evaluation procedure 
arguments doesn't get evaluated until it's necessary. In processes with applicative order of evaluation procedure's arguments get evaluated 
before evaluating of procedure.

So in applicative order's processes expression `(test 0 (p))` arguments is evaluated first: `0` give us `0` and `p` bring process to 
endless loop without any result.

In process with normal order of evaluation arguments isn't evaluated first so we get to procedure body. Let's use substitution model to 
explore it's behavior:

```scheme
(if (= 0 0)
  0
  (p)))
```

By definiton predicate expression is evaluated first and it yields `true` so consequent expression is executed and procedure returns `0`.
Expression `(p)` never gets executed.

So if run this program in language with normal order of evaluation it returns `0` and if run it in program with applicative order it gets
stuck for eternity