Mark             |  Penguin Boi 
:-------------------------:|:-------------------------:
![mark](https://commonmark.org/help/images/favicon.png)  |  ![tux](https://upload.wikimedia.org/wikipedia/commons/thumb/3/3a/Tux_Mono.svg/140px-Tux_Mono.svg.png)

## Foreword

Starting a personal log of various conventions and nuances I run into while browsing through wikis, forums, and everyday Linux usage. Loggint them down so I don't forget as easily :(.

###Table of Contents
| Commands/Topics | Description | Date |
|---|---|---|---|
| [`` `..`, $(..), eval ``](#csbp) | Command Substitution |09/27/2020|
| `echo` | `echo` vs `printf` |09/28/2020|
| `echo` | On The Topic of Curly Braces `${..}` |09/29/2020|

<br/>

###Command Substitution

> ##### Last updated: 09/27/2020

Ran into this problem while doing a little script today and it turns out the using standard `` `..` `` backtick to run commands in a sub-shell had an equivalent, `$(..)`. while reading more into their differences, I found some posts on the "notorious `eval`".

- `` `..` `` or backticks, pretends that anything within it will be run as if typed literally into a terminal, so stuff like `` MACHINE_TYPE=`uname -m`  `` will be ran in a sub process and the output stored into `MACHINE_TYPE` before being used by the main script.
  <br/>
- `$(..)` is <mark>literally the same</mark> as `` `..` `` but it nests nicely inside loops and other constructs, it therefore prefered to use `$(..)` over backticks.

Now we have `eval` being hated on by forum users, and for good reason apparently. Since `eval` does one thing differently than `$(..)`: <mark>argument evaluation</mark>. <ins>`$(..)` evaluations everything inside <mark>all at once</mark> as one unit while `eval` does separation and goes through arguments <mark>one by one</mark></ins>, this is convenient sometimes but is a <mark>security</mark> hazard due to potential quoting mismatches and other syntactical problems, so `$(..)` is the more preferred standard for code substitution.

<br/>

###`echo` vs `printf`

> ##### Last updated: 09/28/2020
