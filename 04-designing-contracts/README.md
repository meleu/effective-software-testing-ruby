# Chapter 4 - Designing contracts

This is a conceptual chapter, none of its code is "runnable".

The translation to Ruby was still a good practice. We can see idiomatic code
(like `value.negative?` instead of `value < 0` in listing 4.1) and the syntax
used by RDoc (in listing 4.2).

**NOTE**: the Java `assert` instruction discussed in the chapter doesn't have an
equivalent in the Ruby language.

## Main takeaways

### Pre/Post conditions and invariants

Designing contracts is basically explicitly defining:

- pre-conditions: what the program needs to function properly.
- post-conditions: what the program guarantees as outcomes.
- invariants: conditions that stay the same before and after the program's execution.

### Changing contracts

Whenever changing a contract, we need to reflect on the impact of the change
(it can break things for clients).

A "change in contract" happens when we create a class inheriting from
another and overwriting a method.

> **NOTE**: Favor composition over inheritance! Here's a talk about it: <https://youtu.be/QKkyq1UE9eU>. If you google about it you'll find a bunch more.

#### Changes in pre-conditions

Making **pre-conditions more restrictive** requires caution.

Example: accepting a smaller set of values as input.

Such change can cause problems for clients relying in the previous contract.
It'll probably require changes in the client's code.

Making pre-conditions less restrictive is probably not a problem.

#### Changes in post-conditions

The scenario here is the opposite...

Making the **post-conditions less restrictive** requires caution.

The clients will probably need to adapt their code to handle an output they
weren't expecting to get before.

Making post-conditions more restrictive is probably not a problem.

### Designing contracts and testing

Pre-conditions, post-conditions and invariants provide good ideas about what to test!
