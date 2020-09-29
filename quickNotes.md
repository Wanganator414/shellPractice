|                          Mark                           |                                              Penguin Boi                                              |
| :-----------------------------------------------------: | :---------------------------------------------------------------------------------------------------: |
| ![mark](https://commonmark.org/help/images/favicon.png) | ![tux](https://upload.wikimedia.org/wikipedia/commons/thumb/3/3a/Tux_Mono.svg/140px-Tux_Mono.svg.png) |

## Foreword

Starting a personal log of various conventions and nuances I run into while browsing through wikis, forums, and everyday Linux usage. Logging them down so I don't forget as easily :(.

### Table of Contents

|                  Commands/Topics                   |                                 Description                                 |    Date    |
| :------------------------------------------------: | :-------------------------------------------------------------------------: | :--------: |
|              `` `..`, $(..), eval ``               | [Command Substitution Best Practices](#command-substitution-best-practices) | 09/27/2020 |
| `(..),$(..),((..)),$((..)),{..},${..},[..],[[..]]` |                     [Which is Which!?](#which-is-which)                     | 09/28/2020 |
|                       `echo`                       |                    [`echo` vs `printf`](#echo-vs-printf)                    | 09/29/2020 |

<br/>

### Command Substitution Best Practices

> ##### Last updated: 09/27/2020

Ran into this problem while doing a little script today and it turns out the using standard `` `..` `` backtick to run commands in a sub-shell had an equivalent, `$(..)`. while reading more into their differences, I found some posts on the "notorious `eval`".

- `` `..` `` or backticks, pretends that anything within it will be run as if typed literally into a terminal, so stuff like `` MACHINE_TYPE=`uname -m`  `` will be ran in a sub process and the output stored into `MACHINE_TYPE` before being used by the main script.
  <br/>
- `$(..)` is <ins><mark>_literally the same_</mark></ins> as `` `..` `` but it nests nicely inside loops and other constructs, it therefore prefered to use `$(..)` over backticks.

Now we have `eval` being hated on by forum users, and for good reason apparently. Since `eval` does one thing differently than `$(..)`: <mark>**argument evaluation**</mark>. <ins>`$(..)` evaluations everything inside <mark>**all at once**</mark> as one unit while `eval` does separation and goes through arguments <mark>**one by one**</mark></ins>, this is convenient sometimes but is a <mark>**security**</mark> hazard due to potential quoting mismatches and other syntactical problems, so `$(..)` is the more preferred standard for code substitution.

<br/>

### Which is Which!?

> ##### Last updated: 09/28/2020

Here we have an assortment of bash constructs, it's about time I had a nice little list to clarify their functionalities...

---

**Construct:** **`(..)`**

**Function:** Starts a new sub shell in which shell commands are run, spits out to stdout by default. Cannot be used to store to variables. If you just want to run a series of commands in one batch, use this.

**Example:**

```bash
(ls -l; echo hello; pwd) #Will run all these commands in sequence in a sub shell and output to current screen by default.
```

---

**Construct:** **`$(..)`**

**Function:** Command substitution of entire argument list (can have multiple commands chained together), executes commands in a sub shell in one go and return its stdout result. Can be used to store to variables.

**Example:**

```bash
MACHINE_TYPE=$(uname -m)  #Sets output of command to variable

MACHINE_TYPE=$(pwd | cut -d'/' -f2)  #Using a chain of commands to extract required text to be stored
```

---

**Construct:** **`((..))`**

**Function:** Used to evaluate arithmetic operations. You must leave spaces around operators for readability and syntactical purposes. You do not need `$` (variable dereferencing) in front of variables and arrays when you are dealing with `((..))`

**Example:**

```bash
var1=1

((var1++))

echo $var1  # var1 is now 2

((var1 = 69))

echo $var1  # var1 is now 69
```

---

**Construct:** **`$((..))`**

**Function:** Same as `((..))` but you can use this version to directly assign values to variables since it returns its output.

**Example:**

```bash
var1=$((74 - 5))  #Direct assignment
echo ${var1}
```

**Construct:** **`{..}`**

**Function:** Used for brace expansions and NOT for delimiting variables.

**Example:**

```bash
echo number{1..5} #Prints number1 all the wya to number5 once the brace expands

echo J{a,e,o}n  #Prints Jan, Jen, and Jon as the parts inside the brace get cycled thru
```

---

**Construct:** **`${..}`**

**Function:** This construct, additional to being used for delimiting variables, is also used for parameter expansion.

**Example:**

```bash
default="kachow"
var1="hello"
echo ${var1%o*} #Prints hell, since everything including and after 'o' is being truncated

echo ${var1/ello/acker} #Prints hacker instead, by using substitution expansion

echo ${var1:-$default} #using a default value in case var1 is null/not assigned
```

---

**Construct:** **`[..]`**

**Function:** <ins>_NOT referring to the array syntax_</ins> This one links to the built in `test` command, used to check true/false of whatever is inside, it's normal usages are for comparing numbers and strings to each other or check if files meet certain conditions. (Sets exit code, 0 if true, otherwise sets other things depending on what was inside)

**Example:**

```bash
if [ "iamText" = "iamText" ]; then
  echo "Target is equivalent" #Prints equivalent because, well they are the same...
else
  echo "Target is not equivalent"
fi
```

##### While we are at it, let's put down array syntax examples, why not?

```bash
arr1[5]="kachow" # This is using left hand side syntax(LHS)
# Similar to C style arrays where you count from index 0


arr2=(a b c d 4 "food" 7)  # Arrays in Bash can contain both numbers and strings
echo ${arr2[1]} # Prints 'b'

#more to come tomorrow.....

```

---

**Construct:** **`[[..]]`**

**Function:** Essentially the updated version of `test`, has the added capability (you can use **&&** and **||** instead of **-a** and **-o**) to check whether a string matches certain regex specifications (with the **=~** syntax). This version does not conform to POSIX standard 100% so it won't work everywhere. (Sets exit codes also)

**Example:**

```bash
string_1="I like food"
my_pattern=".+ike f*"
if [[ $string_1 =~ $my_pattern ]]; then
  echo "Target is found"  #Prints found since the pattern exists inside our string
else
  echo "Target is not found"
fi
```

---

### `echo` vs `printf`

> ##### Last updated: 09/29/2020

- ![#f03c15](https://via.placeholder.com/15/f03c15/000000?text=+) `#f03c15`
