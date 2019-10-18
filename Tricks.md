# Tricks

## 清空文件

适用场景：保留文件，清除文件内容

```bash
## 第一种方式（推荐）：没有空白行
$ cat /dev/null > abc.txt
## 第二种方式：会有一个空白行
$ echo "" > abc.txt
## 第三种方式(与第一种效果相同)
$ > abc.txt
```


