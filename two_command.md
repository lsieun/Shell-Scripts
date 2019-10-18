# Two Command

Keyword: &&, ||

- `make && make install`: 如果`make`命令执行成功，就再接着执行`make install`。如果第一个命令执行不造成，则第二个命令不执行。
- `cd /var/log || echo "change directory fail"`: 如果`cd /var/log`执行失败，则执行`echo "change directory fail"`。如果第一个命令执行成功，则第二个命令不执行。

```bash
cd /var/log || {
    echo "change directory failed"
    pwd
}

cd /root || {
    echo "change directory failed"
    pwd
}
```



