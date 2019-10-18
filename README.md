# Shell-Scripts

:sparkles: 学习Shell Scripts

## Reference

- [Advanced Bash-Scripting Guide](http://tldp.org/LDP/abs/html/index.html)

需要考虑的问题：

- （1） 权限：执行shell script是否需要root权限
- （2） 目录：`cd /var/log || { echo "change directory fail"}` 切换目录可能会执行失败

In the simplest terms, a **shell script** is a file containing a series of commands. **The shell** reads this file and carries out the commands as though they have been entered directly on the command line.

<!-- TOC -->

- [Reference](#reference)
- [1. How to Write a Shell Script](#1-how-to-write-a-shell-script)
  - [1.1. Script File Format](#11-script-file-format)
  - [1.2. Executable Permissions](#12-executable-permissions)
  - [1.3. Script File Location](#13-script-file-location)
  - [Good Locations for Scripts](#good-locations-for-scripts)

<!-- /TOC -->

## 1. How to Write a Shell Script

To successfully create and run a shell script, we need to do three things.

- (1) **Write a script**.
- (2) **Make the script executable**.
- (3) **Put the script somewhere the shell can find it**.

### 1.1. Script File Format

```bash
#!/bin/bash
# This is our first script.
echo 'Hello World!'
```

第一行：The `#!` character sequence is, in fact, a special construct called a **shebang**. The **shebang** is used to tell **the kernel** the name of **the interpreter** that should be used to execute **the script** that follows. Every shell script should include this as its first line.

第二行：Everything from the `#` symbol onward on the line is ignored.

One thing about comments in shell scripts is that they may also appear at the ends of lines provided they are preceded by at least one whitespace character, like so:

```bash
echo 'Hello World!' # This is a comment too
```

Let’s save our script file as `hello_world`.

### 1.2. Executable Permissions

```bash
$ ls -l hello_world
-rw-r--r-- 1 liusen liusen 60 Mar 31 15:47 hello_world
$ chmod 755 hello_world
$ ls -l hello_world 
-rwxr-xr-x 1 liusen liusen 60 Mar 31 15:47 hello_world
```

There are two common permission settings for scripts: `755` for scripts that everyone can execute and `700` for scripts that only the owner can execute. Note that **scripts must be readable to be executed**.

### 1.3. Script File Location

With the permissions set, we can now execute our script.

```bash
$ ./hello_world 
Hello World!
```

For the script to run, we must precede the script name with an explicit path. If we don’t, we get this:

```bash
$ hello_world
bash: hello_world: command not found
```

Why is this? What makes our script different from other programs? As it turns out, nothing. Our script is fine. **Its location is the problem**.

The system searches a list of directories each time it needs to find an executable program, if no explicit path is specified.

The `/bin` directory is one of the directories that the system automatically searches. The list of directories is held within an environment variable named `PATH`. The `PATH` variable contains a colon-separated list of directories to be searched. We can view the contents of `PATH`.

```bash
$ echo $PATH
/home/liusen/bin:/usr/local/bin:/usr/bin:/bin
```

Here we see our list of directories. If our script were located in any of the directories in the list, our problem would be solved. Notice the first directory in the list, `/home/liusen/bin`. Most Linux distributions configure the `PATH` variable to contain a `bin` directory in **the user’s home directory** to allow users to execute their own programs. So, if we create the `bin` directory and place our script within it, it should start to work like other programs.

```bash
$ mkdir bin
$ mv hello_world ~/bin
$ hello_world
Hello World!
```

If the `PATH` variable does not contain the directory, we can easily add it by including this line in our `.bashrc` file:

```bash
export PATH=~/bin:"$PATH"
```

After this change is made, it will take effect in each new terminal session. To apply the change to the current terminal session, we must have the shell reread the `.bashrc` file. This can be done by “sourcing” it.

```bash
$ . .bashrc
```

The dot (`.`) command is a synonym for the `source` command, a shell builtin that reads a specified file of shell commands and treats it like input from the keyboard.

**Note**: Ubuntu (and most other Debian-based distributions) automatically adds the `~/bin` directory to the `PATH` variable if the `~/bin` directory exists when the user’s `.bashrc` file
is executed. So, on Ubuntu systems, if we create the `~/bin` directory and then log out and log in again, everything works.

### Good Locations for Scripts

The `~/bin` directory is a good place to put scripts intended for **personal use**.

If we write a script that** everyone on a system** is allowed to use, the traditional location is `/usr/local/bin`.

Scripts intended for use by the **system administrator** are often located in `/usr/local/sbin`.

In most cases, locally supplied software, whether scripts or compiled programs, should be placed in the `/usr/local` hierarchy and not in `/bin` or `/usr/bin`. These directories are specified by the Linux Filesystem Hierarchy Standard to contain only files supplied and maintained by the Linux distributor.



