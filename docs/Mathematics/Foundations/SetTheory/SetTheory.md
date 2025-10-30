# Set Theory

Set Theory is the branch of mathematics that studies **collections of objects** (sets) and their relationships. It forms the **foundation for most areas of mathematics**, including numbers, functions, spaces, and probability.

---

## 1. What is a Set?
- A **set** is a collection of **distinct, well-defined objects** called **elements**.
- Elements can be **anything**: numbers, letters, objects, functions, or other sets.
- Sets **ignore order** and **repetition**.

---

## 2. Elements
- Denoted by `∈`: `a ∈ A` means `a` is an element of set `A`.
- **Empty set**: `∅` contains no elements.

---

## 3. Special Types of Sets
- **Universal set (U):** Contains all elements under consideration; context-dependent.
- **Subset:** `A ⊆ B` means all elements of A are in B.
- **Singleton set:** Set with exactly one element.
- **Disjoint sets:** Sets with no common elements.
- **Power set:** `P(A)` is the set of all subsets of A.
- **Cartesian product:** `A × B = { (a,b) | a ∈ A, b ∈ B }`, order matters. (E.g `R2 = R x R` - 2D space)

---

## 4. Set Operations
| Operation        | Notation  | Meaning |
|-----------------|----------|---------|
| Union           | `A ∪ B`  | Elements in A **or** B |
| Intersection    | `A ∩ B`  | Elements in **both** A and B |
| Difference      | `A \ B`  | Elements in A **not in** B |
| Complement      | `Aᶜ`     | Elements **not in** A (relative to U) |

---

## 5. Relations and Functions
- **Relation:** Subset of `A × B`.  
- **Function / Map:** A relation where **each element of the domain maps to exactly one element of the codomain**.  

### Function as a set
- A function \(f: A → B\) is a **set of ordered pairs**.
- Functions can also be expressed as **rules**, representing the mapping from domain to codomain. (E.g `f(x) = x^2`)

---

## 6. Cartesian Product
- Cartesian product combines elements from two sets as **ordered pairs**.
- Order matters: `(a,b) ≠ (b,a)`
- Can be generalized to multiple sets, forming tuples of higher dimension.

---

## 7. Why Set Theory is Foundational
1. **Building blocks:** Sets define numbers, functions, sequences, spaces, etc.
2. **Functions as sets:** Functions/maps are rules to assign element from one set to another set. Functions/maps are themselves sets of pairs.
3. **Higher structures:** Groups, rings, vector spaces, and probability can be formally defined using sets.
4. **Formal reasoning:** Provides the **language for logic and proofs**.

---

## 8. Summary
- **Set = collection of elements**  
- **Elements** can be anything; sets can be nested  
- **Operations:** union, intersection, difference, complement  
- **Functions/maps:** rules from domain → codomain, represented as sets of pairs  
- **Cartesian product:** forms tuples and higher-dimensional spaces  
- **Foundational role:** Everything in math can be represented and reasoned about using sets
