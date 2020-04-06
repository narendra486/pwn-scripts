from pwn import *

r = remote('host', 1337)
r.recvline_contains('give you your gift.')
while True:
    s =r.recvline(False).decode()
    print(s)
    # mathematical operations with eval function
    s=s.replace('(','').replace(')','').replace(',','').replace('\'','').replace('>','')
    r.sendline(str(eval(s)))

