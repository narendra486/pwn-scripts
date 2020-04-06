from pwn import *
import re

r = remote('10.10.71.24', 1337)
r.recvline_contains('give you your gift.')
while True:
    s =r.recvline(False).decode()
    print(s)
    
    if 'Here' in s :
        print(s)
        break
        
    s=s.replace('(','').replace(')','').replace(',','').replace('\'','').replace('>','')
    t=str(eval(s))
    print(t)
    r.sendline(t)
r.interactive()   



