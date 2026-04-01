# Ruby Looping Constructs

This document explains the different looping constructs practiced in `loop_basics.rb`, including their usage, behavior, and alternative iterators.

## 1. `loop do ... end`
**Description:**
Creates an infinite loop. You must use `break` to exit the loop manually.

**Usage:**
Use when you need a loop with custom or complex exit conditions.

**Example:**
```ruby
i = 1
loop do
	puts i
	break if i == 5
	i += 1
end
```

**Alternatives:**
- `while` or `until` for condition-based loops.

---

## 2. `while` loop
**Description:**
Repeats the block as long as the condition is true (entry-controlled loop).

**Usage:**
Use when you want to repeat code while a condition holds true.

**Example:**
```ruby
i = 1
while i <= 5
	puts i
	i += 1
end
```

**Alternatives:**
- `until` for the opposite condition.
- `loop do ... break unless ... end` for custom logic.

---

## 3. `until` loop
**Description:**
Repeats the block until the condition becomes true (entry-controlled, opposite of `while`).

**Usage:**
Use when you want to repeat code until a condition is met.

**Example:**
```ruby
i = 1
until i > 5
	puts i
	i += 1
end
```

**Alternatives:**
- `while` with inverted condition.

---

## 4. `for in` loop
**Description:**
Iterates over a range or collection.

**Usage:**
Use for simple iteration over ranges or arrays.

**Example:**
```ruby
for i in 1..5
	puts i
end
```

**Alternatives:**
- `.each`, `.map`, or other enumerators for collections.

---

## 5. `times` iterator
**Description:**
Executes a block a fixed number of times (from 0 to n-1).

**Usage:**
Use for repeating an action a set number of times.

**Example:**
```ruby
5.times do |i|
	puts i
end
```

**Alternatives:**
- `for`, `upto`, or `loop` with a counter.

---

## 6. `upto` iterator
**Description:**
Iterates from a starting number up to an end number (inclusive).

**Usage:**
Use for counting up from a start to an end value.

**Example:**
```ruby
1.upto(5) do |i|
	puts i
end
```

**Alternatives:**
- `for`, `times`, or `.each` on a range.

---

## 7. `downto` iterator
**Description:**
Iterates from a starting number down to an end number (inclusive).

**Usage:**
Use for counting down from a start to an end value.

**Example:**
```ruby
5.downto(1) do |i|
	puts i
end
```

**Alternatives:**
- Reverse ranges, or `for` with decreasing values.

---

## 8. `step` iterator
**Description:**
Iterates from a start to an end, incrementing by a custom step value.

**Usage:**
Use for custom increments or non-standard counting.

**Example:**
```ruby
1.step(10, 5) do |i|
	puts i
end
```

**Alternatives:**
- Manual increment in `while` or `loop`.

---

## 9. `redo` keyword
**Description:**
Repeats the current iteration of a loop without re-evaluating the condition.

**Usage:**
Use to retry an iteration, e.g., after an error or failed validation.

**Example:**
```ruby
i = 0
while i < 3
	puts i
	i += 1
	redo if i == 2
end
```

**Alternatives:**
- Use with caution; can cause infinite loops if not handled properly.

---

Each construct is demonstrated in the code with inline comments for clarity.
