# Bash Builtins

<!-- TOC -->

- [1. I/O](#1-io)
  - [1.1. echo](#11-echo)
  - [1.2. printf](#12-printf)
  - [1.3. read](#13-read)
- [2. Filesystem](#2-filesystem)
  - [2.1. cd](#21-cd)
  - [2.2. pwd](#22-pwd)
- [3. Variables](#3-variables)
  - [3.1. let](#31-let)
  - [3.2. eval](#32-eval)
  - [3.3. set](#33-set)
  - [3.4. unset](#34-unset)
  - [3.5. export](#35-export)
- [4. Script Behavior](#4-script-behavior)
  - [4.1. source, . (dot command)](#41-source--dot-command)
  - [4.2. exit](#42-exit)
  - [4.3. exec](#43-exec)
- [5. Commands](#5-commands)
  - [5.1. true](#51-true)
  - [5.2. false](#52-false)
  - [5.3. type [cmd]](#53-type-cmd)
  - [5.4. help](#54-help)
- [6. Reference](#6-reference)

<!-- /TOC -->

A **builtin** is a command contained within the Bash tool set, literally **built in**. This is either for **performance reasons** -- **builtins** execute faster than **external commands**, which usually require forking off a separate process -- or because **a particular builtin needs direct access to the shell internals**.

这段理解，builtin command存在的原因有两个：

- （1） performance reasons -- builtins execute faster than external commands
- （2） a particular builtin needs direct access to the shell internals

## 1. I/O

### 1.1. echo

prints (to stdout) an expression or variable

```bash
echo Hello
echo $a
```

### 1.2. printf

The `printf`, formatted print, command is an enhanced `echo`. It is a limited variant of the C language `printf()` library function, and its syntax is somewhat different.

语法：

```bash
printf format-string... parameter...
```

### 1.3. read

"Reads" the value of a variable from `stdin`, that is, interactively fetches input from the keyboard.

## 2. Filesystem

### 2.1. cd

The familiar `cd` change directory command finds use in scripts where execution of a command requires being in a specified directory.

- `cd -`: changes to `$OLDPWD`, the previous working directory.

### 2.2. pwd

Print Working Directory. This gives the user's (or script's) current directory. The effect is identical to reading the value of the builtin variable `$PWD`.

## 3. Variables

### 3.1. let

The `let` command carries out arithmetic operations on variables. In many cases, it functions as a less complex version of `expr`.

### 3.2. eval

### 3.3. set

### 3.4. unset

### 3.5. export

The `export` command makes available variables to all child processes of the running script or shell. One important use of the `export` command is in startup files, to initialize and make accessible environmental variables to subsequent user processes.

Unfortunately, **there is no way to export variables back to the parent process**, to the process that called or invoked the script or shell.

## 4. Script Behavior

### 4.1. source, . (dot command)

This command, when invoked from the command-line, executes a script.

Within a script, a `source file-name` loads the file `file-name`. Sourcing a file (dot-command) imports code into the script, appending to the script (same effect as the `#include` directive in a `C` program).

### 4.2. exit

Unconditionally terminates a script. The `exit` command may optionally take an integer argument, which is returned to the shell as the "exit status" of the script. It is good practice to end all but the simplest scripts with an `exit 0`, indicating a successful run.

If a script terminates with an `exit` lacking an argument, the exit status of the script is the exit status of the last command executed in the script, not counting the `exit`. This is equivalent to an `exit $?`.

### 4.3. exec

## 5. Commands

### 5.1. true

### 5.2. false

### 5.3. type [cmd]

Similar to the `which` external command, `type cmd` identifies "cmd." Unlike `which`, `type` is a Bash builtin. The useful `-a` option to `type` identifies `keywords` and `builtins`, and also locates system commands with identical names.

### 5.4. help

Gets a short usage summary of a shell builtin. This is the counterpart to `whatis`, but for builtins. The display of `help` information got a much-needed update in the **version 4 release of Bash**.

可以通过`bash --version`来查看bash的版本信息。

## 6. Reference

- [Internal Commands and Builtins](http://tldp.org/LDP/abs/html/internal.html)
