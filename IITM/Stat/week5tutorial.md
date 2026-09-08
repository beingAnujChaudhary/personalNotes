## Core ideas used in these questions

### 1. Fundamental Counting Principle

If one task can be completed in $m$ ways and, after that, another task can be completed in $n$ ways, then the two-stage process can be completed in

$$
m\times n
$$

ways.

For several successive choices:

$$
n_1\times n_2\times n_3\times\cdots
$$

---

### 2. Addition Principle

If a result can occur through **mutually exclusive** cases, add the number of possibilities.

For example, if a password is either:

- made entirely of letters, **or**
- made entirely of digits,

then

$$
N=N_{\text{letters}}+N_{\text{digits}}
$$

---

### 3. Permutations

Use permutations when:

- objects are distinct, and
- **order matters**.

The number of ways to arrange $r$ objects selected from $n$ distinct objects is

$$
{}^nP_r=\frac{n!}{(n-r)!}
$$

---

### 4. Combinations

Use combinations when:

- objects are selected, and
- **order does not matter**.

The number of ways to select $r$ objects from $n$ distinct objects is

$$
{n\choose r}=\frac{n!}{r!(n-r)!}
$$

---

# Question 1 — Guessing the Married Couples

## Question

In a building, **6 men** and **4 women** are staying. You know there are exactly **3 married couples**.

In how many ways can you guess who the couples are?

---

## Solution

We need to form exactly $3$ man-woman couples.

There are three stages:

1. Choose which $3$ men are married.
2. Choose which $3$ women are married.
3. Pair the selected men with the selected women.

### Step 1: Choose 3 men from 6

Order does not matter while selecting the married men, so we use a combination:

$$
{6\choose3}
=
\frac{6!}{3!3!}
=
20
$$

### Step 2: Choose 3 women from 4

Similarly,

$$
{4\choose3}
=
4
$$

### Step 3: Pair the selected men and women

Suppose the selected men are $M_1,M_2,M_3$ and the selected women are $W_1,W_2,W_3$.

For $M_1$, there are $3$ choices of spouse.

For the next man, there are $2$ choices.

For the last man, there is $1$ choice.

Therefore,

$$
3\times2\times1=3!=6
$$

possible pairings.

### Total

By the Fundamental Counting Principle,

$$
{6\choose3}{4\choose3}(3!)
$$

Therefore,

$$
20\times4\times6=480
$$

## Final Answer

$$
\boxed{480}
$$

### Alternative method

Choose $3$ of the $4$ women and then assign them, in order, to $3$ different men chosen from $6$:

$$
{4\choose3}\times {}^6P_3
$$

Since

$$
{}^6P_3=6\times5\times4=120,
$$

we obtain

$$
4\times120=480.
$$

---

# Question 2 — Four Dice Showing Different Numbers

## Question

Four dice are rolled. A number is observed on the top face of each die.

How many outcomes are possible such that **each die shows a different number**?

---

## Solution

Each ordinary die has the possible outcomes

$$
\{1,2,3,4,5,6\}.
$$

We need the four dice to show four **different** numbers.

Treat the dice as distinguishable: Die 1, Die 2, Die 3, and Die 4.

### Die 1

Any of the $6$ numbers can appear:

$$
6
$$

choices.

### Die 2

Its number must be different from Die 1, so:

$$
5
$$

choices remain.

### Die 3

Two values have already been used:

$$
4
$$

choices remain.

### Die 4

Three values have already been used:

$$
3
$$

choices remain.

Hence,

$$
6\times5\times4\times3
$$

possible outcomes.

Therefore,

$$
6\times5\times4\times3=360.
$$

This is also the permutation

$$
{}^6P_4
=
\frac{6!}{2!}
=
360.
$$

## Final Answer

$$
\boxed{360}
$$

### Why order matters

The outcome

$$
(1,2,3,4)
$$

is different from

$$
(4,3,2,1),
$$

because the numbers appear on different dice.

---

# Question 3 — Rolling a Die and Tossing a Coin

## Question

A fair die is rolled and a fair coin is tossed.

How many different ordered pairs of outcomes of the die and the coin are possible?

---

## Solution

A die has $6$ possible outcomes:

$$
\{1,2,3,4,5,6\}.
$$

A coin has $2$ possible outcomes:

$$
\{H,T\}.
$$

For each die result, either $H$ or $T$ can occur.

Therefore, by the Fundamental Counting Principle,

$$
6\times2=12.
$$

The complete sample space can be written as

$$
\begin{aligned}
S=\{&
(1,H),(1,T),\\
&(2,H),(2,T),\\
&(3,H),(3,T),\\
&(4,H),(4,T),\\
&(5,H),(5,T),\\
&(6,H),(6,T)
\}.
\end{aligned}
$$

Hence,

$$
|S|=12.
$$

## Final Answer

$$
\boxed{12}
$$

---

# Question 4 — Four-Digit Numbers Beginning with 28

## Question

How many $4$-digit numbers can be formed using the digits $0$ to $9$ if the **first and second digits are $2$ and $8$ respectively**?

Repetition of digits is not allowed.

---

## Solution

The number has the form

$$
28\_\_
$$

The first two positions are already fixed.

### Available digits

Originally there are $10$ digits:

$$
0,1,2,3,4,5,6,7,8,9.
$$

Since $2$ and $8$ have already been used, they cannot be used again.

Therefore, $8$ digits remain:

$$
\{0,1,3,4,5,6,7,9\}.
$$

### Third position

There are

$$
8
$$

choices.

### Fourth position

After selecting the third digit, only

$$
7
$$

choices remain.

Therefore,

$$
8\times7=56.
$$

Equivalently,

$$
{}^8P_2
=
8\times7
=
56.
$$

## Final Answer

$$
\boxed{56}
$$

### Important observation

Zero is allowed in the third or fourth position because the first digit is already fixed as $2$. Therefore, every arrangement produced is automatically a valid $4$-digit number.

---

# Question 5 — Words from Five Different Letter Blocks

## Question

Lakhya has five different letter blocks.

How many different words of **more than four letters** (the words may be meaningless) can be formed using these five letters **without repetition**?

---

## Solution

There are exactly $5$ different letters available.

The question asks for words containing **more than four letters**.

Since only five letters exist and repetition is not allowed, the only possible word length is

$$
5.
$$

So every valid word must use all five letters exactly once.

The number of arrangements of $5$ distinct letters is

$$
5!.
$$

Therefore,

$$
5!
=
5\times4\times3\times2\times1
=
120.
$$

Equivalently,

$$
{}^5P_5=120.
$$

## Final Answer

$$
\boxed{120}
$$

### Why we do not include four-letter words

"More than four letters" means

$$
\text{length}>4.
$$

Therefore, a four-letter arrangement is not allowed.

---

# Question 6 — Four-Character Password Using Only Letters or Only Numbers

## Question

Nisha wants to set a $4$-digit password for her laptop. She can choose all the positions as:

- alphabets, using both lowercase and uppercase letters, **or**
- numbers from $0$ to $9$.

Repetition of alphabets and numbers is **not allowed**.

In how many ways can she set the password?

> Since letters are allowed, it is more precise to call this a **4-character password**.

---

## Solution

There are two mutually exclusive cases.

### Case 1: Password contains only letters

There are $26$ lowercase and $26$ uppercase English letters:

$$
26+26=52.
$$

Since repetition is not allowed:

- first position: $52$ choices,
- second position: $51$ choices,
- third position: $50$ choices,
- fourth position: $49$ choices.

Therefore,

$$
N_{\text{letters}}
=
52\times51\times50\times49.
$$

This is

$$
{}^{52}P_4.
$$

Calculating,

$$
52\times51\times50\times49
=
6,497,400.
$$

---

### Case 2: Password contains only numbers

There are $10$ digits:

$$
0,1,2,\ldots,9.
$$

Because this is a password rather than a four-digit numerical value, a leading $0$ is allowed.

With no repetition:

$$
N_{\text{digits}}
=
10\times9\times8\times7.
$$

Therefore,

$$
N_{\text{digits}}
=
5,040.
$$

---

### Add the two cases

Since the password is either all letters **or** all numbers,

$$
N
=
N_{\text{letters}}
+
N_{\text{digits}}.
$$

Hence,

$$
N
=
6,497,400+5,040.
$$

Therefore,

$$
N=6,502,440.
$$

## Final Answer

$$
\boxed{6,502,440}
$$

---

# Question 7 — Alphanumeric Password, No Repetition

## Question

Nisha wants to set a $4$-character password.

If she wants to use an alphanumeric password:

- she cannot use lowercase letters,
- only the **first position** can be an alphabet,
- the remaining positions are numbers,
- repetition of alphabets and numbers is **not allowed**.

In how many ways can she set the password?

---

## Solution

The password has the structure

$$
LDDD,
$$

where:

- $L$ is an uppercase letter,
- each $D$ is a digit.

### First position: uppercase alphabet

There are

$$
26
$$

uppercase letters.

So the first position has

$$
26
$$

choices.

### Second position: digit

Any of the $10$ digits can be used:

$$
10
$$

choices.

### Third position: digit

Repetition is not allowed, so one digit has already been used:

$$
9
$$

choices remain.

### Fourth position: digit

Two digits have already been used:

$$
8
$$

choices remain.

Therefore,

$$
26\times10\times9\times8.
$$

Calculating,

$$
26\times10\times9\times8
=
18,720.
$$

The digit part can also be written as

$$
{}^{10}P_3.
$$

Thus,

$$
26\times{}^{10}P_3
=
18,720.
$$

## Final Answer

$$
\boxed{18,720}
$$

---

# Question 8 — Alphanumeric Password, Repetition Allowed

## Question

Nisha wants to set a $4$-character password.

If she wants to use an alphanumeric password:

- she cannot use lowercase letters,
- only the **first position** can be an alphabet,
- the remaining positions are numbers,
- repetition of alphabets and numbers is **allowed**.

In how many ways can she set the password?

---

## Solution

Again the password has the structure

$$
LDDD.
$$

### First position

Only an uppercase letter can be used.

There are

$$
26
$$

choices.

### Remaining three positions

Each position is a digit.

Because repetition is allowed, every digit position independently has

$$
10
$$

choices.

Therefore,

$$
26\times10\times10\times10.
$$

That is,

$$
26\times10^3.
$$

Hence,

$$
26\times1000=26,000.
$$

## Final Answer

$$
\boxed{26,000}
$$

---

# Summary Table

| Question | Main idea | Calculation | Answer |
|---|---|---:|---:|
| 1 | Selection + pairing | ${6\choose3}{4\choose3}(3!)$ | $\boxed{480}$ |
| 2 | Permutation without repetition | $6\times5\times4\times3$ | $\boxed{360}$ |
| 3 | Fundamental Counting Principle | $6\times2$ | $\boxed{12}$ |
| 4 | Two positions fixed | $8\times7$ | $\boxed{56}$ |
| 5 | Arrangement of 5 distinct letters | $5!$ | $\boxed{120}$ |
| 6 | Addition of two exclusive cases | ${}^{52}P_4+{}^{10}P_4$ | $\boxed{6,502,440}$ |
| 7 | Letter followed by 3 distinct digits | $26\times10\times9\times8$ | $\boxed{18,720}$ |
| 8 | Letter followed by 3 digits, repetition allowed | $26\times10^3$ | $\boxed{26,000}$ |

---

# Quick Decision Guide

When solving counting questions, ask these questions in order:

1. **Are there multiple stages?**  
   If yes, multiplication is often required.

2. **Are there mutually exclusive cases?**  
   If yes, count each case separately and add.

3. **Does order matter?**  
   - Yes $\rightarrow$ permutation.
   - No $\rightarrow$ combination.

4. **Is repetition allowed?**  
   - Yes $\rightarrow$ the number of choices may remain unchanged.
   - No $\rightarrow$ the number of available choices decreases after each selection.

5. **Are any positions fixed?**  
   Fixed positions contribute a factor of $1$ and reduce the remaining available choices.

---

# Formula Sheet

## Factorial

$$
n!=n(n-1)(n-2)\cdots2\cdot1
$$

with

$$
0!=1.
$$

## Permutation

$$
{}^nP_r
=
\frac{n!}{(n-r)!}
$$

## Combination

$$
{n\choose r}
=
\frac{n!}{r!(n-r)!}
$$

## Arrangements with repetition allowed

If each of $r$ positions can independently take any of $n$ values,

$$
n^r
$$

arrangements are possible.

---

## Final Answers at a Glance

$$
\boxed{
\begin{aligned}
Q1&=480\\
Q2&=360\\
Q3&=12\\
Q4&=56\\
Q5&=120\\
Q6&=6,502,440\\
Q7&=18,720\\
Q8&=26,000
\end{aligned}
}
$$
"""

