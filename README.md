# Ruby Basics — Learning Notes


Small collection of learning notes and example code for Ruby basics.


**Project Overview**

- **Purpose**: Short, self-contained notes and example code to practise Ruby fundamentals — arrays, hashes, enumerators, iteration, blocks, procs, lambdas, closures, metaprogramming, and related concepts.
- **Where to read**: Open the linked files below in your editor or view them on GitHub.


**Files**

- **Day1.md**: [Day 1/Day1.md](Day%201/Day1.md) — Day 1 notes, concepts covered, and exercises.
- **Enumerable.md**: [Day 1/Enumerable.md](Day%201/Enumerable.md) — Detailed guide to Ruby Enumerators (external vs internal iteration, `next`, `peek`, custom and infinite enumerators, Rails examples, and a practice exercise).
- **iterator.rb**: [Day 1/iterator.rb](Day%201/iterator.rb) — Example Ruby script demonstrating iterator/enumerator usage; runnable locally.

**Day 2**
- **Day2.md**: [Day 2/Day2.md](Day%202/Day2.md) — Day 2 notes: Ruby blocks, `yield`, `block_given?`, procs, lambdas, closures, delayed execution, block scoping, and more.
- **block.rb**: [Day 2/block.rb](Day%202/block.rb) — Examples of custom block usage, `yield`, and block safety.
- **proc.rb**: [Day 2/proc.rb](Day%202/proc.rb) — Using procs for operations, filtering, and pipelines.
- **lambda.rb**: [Day 2/lambda.rb](Day%202/lambda.rb) — Lambda creation, validation, and strictness.
- **closure.rb**: [Day 2/closure.rb](Day%202/closure.rb) — Closures, stateful functions, encapsulation, and custom map/delay patterns.


**Usage**

- View the markdown files in your editor or on GitHub via the links above.
- Run the Ruby examples locally with:

```bash
ruby "Day 1/iterator.rb"
ruby "Day 2/block.rb"
ruby "Day 2/proc.rb"
ruby "Day 2/lambda.rb"
ruby "Day 2/closure.rb"
```


**Day 3**
- **Day3.md**: [Day 3/Day3.md](Day%203/Day3.md) — Day 3 notes: Ruby metaprogramming, `instance_eval`, `class_eval`, `define_method`, DSLs, and dynamic method creation.
- **class_eval.rb**: [Day 3/class_eval.rb](Day%203/class_eval.rb) — Examples of using `class_eval` for dynamic class modification, attribute generation, and a mini router DSL.
- **instance_eval.rb**: [Day 3/instance_eval.rb](Day%203/instance_eval.rb) — Examples of `instance_eval` for object context execution, dynamic method calls, and configuration DSLs.
- **meta_programming.rb**: [Day 3/meta_programming.rb](Day%203/meta_programming.rb) — Metaprogramming challenges: `send`, `define_method`, `method_missing`, and DSL-style configuration.

**Usage**

- View the markdown files in your editor or on GitHub via the links above.
- Run the Ruby examples locally with:

```bash
ruby "Day 1/iterator.rb"
ruby "Day 2/block.rb"
ruby "Day 2/proc.rb"
ruby "Day 2/lambda.rb"
ruby "Day 2/closure.rb"
ruby "Day 3/class_eval.rb"
ruby "Day 3/instance_eval.rb"
ruby "Day 3/meta_programming.rb"
```


---

**Fundamentals**

In-depth examples and documentation on core Ruby data structures, organized by topic.

**Arrays** (`fundamentals/arrays/`)
- **array_operations.md**: [fundamentals/arrays/array_operations.md](fundamentals/arrays/array_operations.md) — Comprehensive reference for Ruby Array operations (creation, access, add/remove, search, filter, transform, sort, iterate, enumerators, and lazy evaluation).
- **array_basics.rb**: [fundamentals/arrays/array_basics.rb](fundamentals/arrays/array_basics.rb) — Array creation, access, and core methods.
- **basic_operations.rb**: [fundamentals/arrays/basic_operations.rb](fundamentals/arrays/basic_operations.rb) — Common array operations (push, pop, shift, unshift, etc.).
- **iteration.rb**: [fundamentals/arrays/iteration.rb](fundamentals/arrays/iteration.rb) — Iterating arrays with `each`, `each_with_index`, `each_with_object`.
- **custom_each.rb**: [fundamentals/arrays/custom_each.rb](fundamentals/arrays/custom_each.rb) — Building a custom `each` method.
- **custom_map.rb**: [fundamentals/arrays/custom_map.rb](fundamentals/arrays/custom_map.rb) — Building a custom `map` method.
- **custom_select.rb**: [fundamentals/arrays/custom_select.rb](fundamentals/arrays/custom_select.rb) — Building a custom `select` method.
- **custom_reduce.rb**: [fundamentals/arrays/custom_reduce.rb](fundamentals/arrays/custom_reduce.rb) — Building a custom `reduce` method.
- **enumerator.rb**: [fundamentals/arrays/enumerator.rb](fundamentals/arrays/enumerator.rb) — Enumerator creation and usage with arrays.
- **lazy_enumerator.rb**: [fundamentals/arrays/lazy_enumerator.rb](fundamentals/arrays/lazy_enumerator.rb) — Lazy evaluation with arrays and infinite sequences.

**Hashes** (`fundamentals/hashes/`)
- **hash_operations.md**: [fundamentals/hashes/hash_operations.md](fundamentals/hashes/hash_operations.md) — Comprehensive reference for Ruby Hash operations (creation, access, merge, transform, filter, dig, default_proc, slice, except, compact, deep_merge, and more).
- **hash_basics.rb**: [fundamentals/hashes/hash_basics.rb](fundamentals/hashes/hash_basics.rb) — Hash creation, access, merge vs merge!, transform_keys/values, select, reject, invert, dig, default_proc, group_by, slice, except, compact, and deep_merge.

**Enumerable** (`fundamentals/enumerable/`)
- **enumerable_operations.md**: [fundamentals/enumerable/enumerable_operations.md](fundamentals/enumerable/enumerable_operations.md) — Comprehensive reference for Ruby Enumerable methods (map, select, reject, find, reduce, group_by, each_with_object, predicates, aggregation, and more).
- **enumerable.rb**: [fundamentals/enumerable/enumerable.rb](fundamentals/enumerable/enumerable.rb) — Examples of map, select, reject, find, reduce, group_by, each_with_object, and using Enumerable on hashes.

**Usage**

```bash
ruby fundamentals/arrays/array_basics.rb
ruby fundamentals/arrays/basic_operations.rb
ruby fundamentals/arrays/iteration.rb
ruby fundamentals/arrays/custom_each.rb
ruby fundamentals/arrays/custom_map.rb
ruby fundamentals/arrays/custom_select.rb
ruby fundamentals/arrays/custom_reduce.rb
ruby fundamentals/arrays/enumerator.rb
ruby fundamentals/arrays/lazy_enumerator.rb
ruby fundamentals/hashes/hash_basics.rb
ruby fundamentals/enumerable/enumerable.rb
```


**Contributing / Next steps**

- Add more days or exercises as new files under the appropriate `Day N/` folder.
- Add more fundamentals topics under the `fundamentals/` folder.

