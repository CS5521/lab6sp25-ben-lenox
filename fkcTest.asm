
_fkcTest:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "types.h"
#include "stat.h"
#include "user.h"
int
main(int argc, char * argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 10             	sub    $0x10,%esp
  printf(1, "number of forks when program starts: %d\n", fkc(1));
   9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  10:	e8 f8 03 00 00       	call   40d <fkc>
  15:	89 44 24 08          	mov    %eax,0x8(%esp)
  19:	c7 44 24 04 c4 08 00 	movl   $0x8c4,0x4(%esp)
  20:	00 
  21:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  28:	e8 c8 04 00 00       	call   4f5 <printf>
  if (fork() == 0) exit();
  2d:	e8 2b 03 00 00       	call   35d <fork>
  32:	85 c0                	test   %eax,%eax
  34:	75 05                	jne    3b <main+0x3b>
  36:	e8 2a 03 00 00       	call   365 <exit>
  if (fork() == 0) exit();
  3b:	e8 1d 03 00 00       	call   35d <fork>
  40:	85 c0                	test   %eax,%eax
  42:	75 05                	jne    49 <main+0x49>
  44:	e8 1c 03 00 00       	call   365 <exit>
  printf(1, "number of forks after two more forks: %d\n", fkc(1));
  49:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  50:	e8 b8 03 00 00       	call   40d <fkc>
  55:	89 44 24 08          	mov    %eax,0x8(%esp)
  59:	c7 44 24 04 f0 08 00 	movl   $0x8f0,0x4(%esp)
  60:	00 
  61:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  68:	e8 88 04 00 00       	call   4f5 <printf>
  wait();
  6d:	e8 fb 02 00 00       	call   36d <wait>
  wait();
  72:	e8 f6 02 00 00       	call   36d <wait>
  printf(1, "number of forks after fork count cleared: %d\n", fkc(0));
  77:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  7e:	e8 8a 03 00 00       	call   40d <fkc>
  83:	89 44 24 08          	mov    %eax,0x8(%esp)
  87:	c7 44 24 04 1c 09 00 	movl   $0x91c,0x4(%esp)
  8e:	00 
  8f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  96:	e8 5a 04 00 00       	call   4f5 <printf>
  if (fork() == 0) exit();
  9b:	e8 bd 02 00 00       	call   35d <fork>
  a0:	85 c0                	test   %eax,%eax
  a2:	75 05                	jne    a9 <main+0xa9>
  a4:	e8 bc 02 00 00       	call   365 <exit>
  if (fork() == 0) exit();
  a9:	e8 af 02 00 00       	call   35d <fork>
  ae:	85 c0                	test   %eax,%eax
  b0:	75 05                	jne    b7 <main+0xb7>
  b2:	e8 ae 02 00 00       	call   365 <exit>
  if (fork() == 0) exit();
  b7:	e8 a1 02 00 00       	call   35d <fork>
  bc:	85 c0                	test   %eax,%eax
  be:	75 05                	jne    c5 <main+0xc5>
  c0:	e8 a0 02 00 00       	call   365 <exit>
  printf(1, "number of forks after three more forks: %d\n", fkc(1));
  c5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  cc:	e8 3c 03 00 00       	call   40d <fkc>
  d1:	89 44 24 08          	mov    %eax,0x8(%esp)
  d5:	c7 44 24 04 4c 09 00 	movl   $0x94c,0x4(%esp)
  dc:	00 
  dd:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  e4:	e8 0c 04 00 00       	call   4f5 <printf>
  wait();
  e9:	e8 7f 02 00 00       	call   36d <wait>
  wait();
  ee:	e8 7a 02 00 00       	call   36d <wait>
  wait();
  f3:	e8 75 02 00 00       	call   36d <wait>
  exit();
  f8:	e8 68 02 00 00       	call   365 <exit>

000000fd <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  fd:	55                   	push   %ebp
  fe:	89 e5                	mov    %esp,%ebp
 100:	57                   	push   %edi
 101:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 102:	8b 4d 08             	mov    0x8(%ebp),%ecx
 105:	8b 55 10             	mov    0x10(%ebp),%edx
 108:	8b 45 0c             	mov    0xc(%ebp),%eax
 10b:	89 cb                	mov    %ecx,%ebx
 10d:	89 df                	mov    %ebx,%edi
 10f:	89 d1                	mov    %edx,%ecx
 111:	fc                   	cld    
 112:	f3 aa                	rep stos %al,%es:(%edi)
 114:	89 ca                	mov    %ecx,%edx
 116:	89 fb                	mov    %edi,%ebx
 118:	89 5d 08             	mov    %ebx,0x8(%ebp)
 11b:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 11e:	5b                   	pop    %ebx
 11f:	5f                   	pop    %edi
 120:	5d                   	pop    %ebp
 121:	c3                   	ret    

00000122 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 122:	55                   	push   %ebp
 123:	89 e5                	mov    %esp,%ebp
 125:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 128:	8b 45 08             	mov    0x8(%ebp),%eax
 12b:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 12e:	90                   	nop
 12f:	8b 45 08             	mov    0x8(%ebp),%eax
 132:	8d 50 01             	lea    0x1(%eax),%edx
 135:	89 55 08             	mov    %edx,0x8(%ebp)
 138:	8b 55 0c             	mov    0xc(%ebp),%edx
 13b:	8d 4a 01             	lea    0x1(%edx),%ecx
 13e:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 141:	0f b6 12             	movzbl (%edx),%edx
 144:	88 10                	mov    %dl,(%eax)
 146:	0f b6 00             	movzbl (%eax),%eax
 149:	84 c0                	test   %al,%al
 14b:	75 e2                	jne    12f <strcpy+0xd>
    ;
  return os;
 14d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 150:	c9                   	leave  
 151:	c3                   	ret    

00000152 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 152:	55                   	push   %ebp
 153:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 155:	eb 08                	jmp    15f <strcmp+0xd>
    p++, q++;
 157:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 15b:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
 15f:	8b 45 08             	mov    0x8(%ebp),%eax
 162:	0f b6 00             	movzbl (%eax),%eax
 165:	84 c0                	test   %al,%al
 167:	74 10                	je     179 <strcmp+0x27>
 169:	8b 45 08             	mov    0x8(%ebp),%eax
 16c:	0f b6 10             	movzbl (%eax),%edx
 16f:	8b 45 0c             	mov    0xc(%ebp),%eax
 172:	0f b6 00             	movzbl (%eax),%eax
 175:	38 c2                	cmp    %al,%dl
 177:	74 de                	je     157 <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
 179:	8b 45 08             	mov    0x8(%ebp),%eax
 17c:	0f b6 00             	movzbl (%eax),%eax
 17f:	0f b6 d0             	movzbl %al,%edx
 182:	8b 45 0c             	mov    0xc(%ebp),%eax
 185:	0f b6 00             	movzbl (%eax),%eax
 188:	0f b6 c0             	movzbl %al,%eax
 18b:	29 c2                	sub    %eax,%edx
 18d:	89 d0                	mov    %edx,%eax
}
 18f:	5d                   	pop    %ebp
 190:	c3                   	ret    

00000191 <strlen>:

uint
strlen(const char *s)
{
 191:	55                   	push   %ebp
 192:	89 e5                	mov    %esp,%ebp
 194:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 197:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 19e:	eb 04                	jmp    1a4 <strlen+0x13>
 1a0:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 1a4:	8b 55 fc             	mov    -0x4(%ebp),%edx
 1a7:	8b 45 08             	mov    0x8(%ebp),%eax
 1aa:	01 d0                	add    %edx,%eax
 1ac:	0f b6 00             	movzbl (%eax),%eax
 1af:	84 c0                	test   %al,%al
 1b1:	75 ed                	jne    1a0 <strlen+0xf>
    ;
  return n;
 1b3:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 1b6:	c9                   	leave  
 1b7:	c3                   	ret    

000001b8 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1b8:	55                   	push   %ebp
 1b9:	89 e5                	mov    %esp,%ebp
 1bb:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 1be:	8b 45 10             	mov    0x10(%ebp),%eax
 1c1:	89 44 24 08          	mov    %eax,0x8(%esp)
 1c5:	8b 45 0c             	mov    0xc(%ebp),%eax
 1c8:	89 44 24 04          	mov    %eax,0x4(%esp)
 1cc:	8b 45 08             	mov    0x8(%ebp),%eax
 1cf:	89 04 24             	mov    %eax,(%esp)
 1d2:	e8 26 ff ff ff       	call   fd <stosb>
  return dst;
 1d7:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1da:	c9                   	leave  
 1db:	c3                   	ret    

000001dc <strchr>:

char*
strchr(const char *s, char c)
{
 1dc:	55                   	push   %ebp
 1dd:	89 e5                	mov    %esp,%ebp
 1df:	83 ec 04             	sub    $0x4,%esp
 1e2:	8b 45 0c             	mov    0xc(%ebp),%eax
 1e5:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 1e8:	eb 14                	jmp    1fe <strchr+0x22>
    if(*s == c)
 1ea:	8b 45 08             	mov    0x8(%ebp),%eax
 1ed:	0f b6 00             	movzbl (%eax),%eax
 1f0:	3a 45 fc             	cmp    -0x4(%ebp),%al
 1f3:	75 05                	jne    1fa <strchr+0x1e>
      return (char*)s;
 1f5:	8b 45 08             	mov    0x8(%ebp),%eax
 1f8:	eb 13                	jmp    20d <strchr+0x31>
  for(; *s; s++)
 1fa:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 1fe:	8b 45 08             	mov    0x8(%ebp),%eax
 201:	0f b6 00             	movzbl (%eax),%eax
 204:	84 c0                	test   %al,%al
 206:	75 e2                	jne    1ea <strchr+0xe>
  return 0;
 208:	b8 00 00 00 00       	mov    $0x0,%eax
}
 20d:	c9                   	leave  
 20e:	c3                   	ret    

0000020f <gets>:

char*
gets(char *buf, int max)
{
 20f:	55                   	push   %ebp
 210:	89 e5                	mov    %esp,%ebp
 212:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 215:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 21c:	eb 4c                	jmp    26a <gets+0x5b>
    cc = read(0, &c, 1);
 21e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 225:	00 
 226:	8d 45 ef             	lea    -0x11(%ebp),%eax
 229:	89 44 24 04          	mov    %eax,0x4(%esp)
 22d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 234:	e8 44 01 00 00       	call   37d <read>
 239:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 23c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 240:	7f 02                	jg     244 <gets+0x35>
      break;
 242:	eb 31                	jmp    275 <gets+0x66>
    buf[i++] = c;
 244:	8b 45 f4             	mov    -0xc(%ebp),%eax
 247:	8d 50 01             	lea    0x1(%eax),%edx
 24a:	89 55 f4             	mov    %edx,-0xc(%ebp)
 24d:	89 c2                	mov    %eax,%edx
 24f:	8b 45 08             	mov    0x8(%ebp),%eax
 252:	01 c2                	add    %eax,%edx
 254:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 258:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 25a:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 25e:	3c 0a                	cmp    $0xa,%al
 260:	74 13                	je     275 <gets+0x66>
 262:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 266:	3c 0d                	cmp    $0xd,%al
 268:	74 0b                	je     275 <gets+0x66>
  for(i=0; i+1 < max; ){
 26a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 26d:	83 c0 01             	add    $0x1,%eax
 270:	3b 45 0c             	cmp    0xc(%ebp),%eax
 273:	7c a9                	jl     21e <gets+0xf>
      break;
  }
  buf[i] = '\0';
 275:	8b 55 f4             	mov    -0xc(%ebp),%edx
 278:	8b 45 08             	mov    0x8(%ebp),%eax
 27b:	01 d0                	add    %edx,%eax
 27d:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 280:	8b 45 08             	mov    0x8(%ebp),%eax
}
 283:	c9                   	leave  
 284:	c3                   	ret    

00000285 <stat>:

int
stat(const char *n, struct stat *st)
{
 285:	55                   	push   %ebp
 286:	89 e5                	mov    %esp,%ebp
 288:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 28b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 292:	00 
 293:	8b 45 08             	mov    0x8(%ebp),%eax
 296:	89 04 24             	mov    %eax,(%esp)
 299:	e8 07 01 00 00       	call   3a5 <open>
 29e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 2a1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 2a5:	79 07                	jns    2ae <stat+0x29>
    return -1;
 2a7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2ac:	eb 23                	jmp    2d1 <stat+0x4c>
  r = fstat(fd, st);
 2ae:	8b 45 0c             	mov    0xc(%ebp),%eax
 2b1:	89 44 24 04          	mov    %eax,0x4(%esp)
 2b5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2b8:	89 04 24             	mov    %eax,(%esp)
 2bb:	e8 fd 00 00 00       	call   3bd <fstat>
 2c0:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 2c3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2c6:	89 04 24             	mov    %eax,(%esp)
 2c9:	e8 bf 00 00 00       	call   38d <close>
  return r;
 2ce:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 2d1:	c9                   	leave  
 2d2:	c3                   	ret    

000002d3 <atoi>:

int
atoi(const char *s)
{
 2d3:	55                   	push   %ebp
 2d4:	89 e5                	mov    %esp,%ebp
 2d6:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 2d9:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 2e0:	eb 25                	jmp    307 <atoi+0x34>
    n = n*10 + *s++ - '0';
 2e2:	8b 55 fc             	mov    -0x4(%ebp),%edx
 2e5:	89 d0                	mov    %edx,%eax
 2e7:	c1 e0 02             	shl    $0x2,%eax
 2ea:	01 d0                	add    %edx,%eax
 2ec:	01 c0                	add    %eax,%eax
 2ee:	89 c1                	mov    %eax,%ecx
 2f0:	8b 45 08             	mov    0x8(%ebp),%eax
 2f3:	8d 50 01             	lea    0x1(%eax),%edx
 2f6:	89 55 08             	mov    %edx,0x8(%ebp)
 2f9:	0f b6 00             	movzbl (%eax),%eax
 2fc:	0f be c0             	movsbl %al,%eax
 2ff:	01 c8                	add    %ecx,%eax
 301:	83 e8 30             	sub    $0x30,%eax
 304:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 307:	8b 45 08             	mov    0x8(%ebp),%eax
 30a:	0f b6 00             	movzbl (%eax),%eax
 30d:	3c 2f                	cmp    $0x2f,%al
 30f:	7e 0a                	jle    31b <atoi+0x48>
 311:	8b 45 08             	mov    0x8(%ebp),%eax
 314:	0f b6 00             	movzbl (%eax),%eax
 317:	3c 39                	cmp    $0x39,%al
 319:	7e c7                	jle    2e2 <atoi+0xf>
  return n;
 31b:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 31e:	c9                   	leave  
 31f:	c3                   	ret    

00000320 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 320:	55                   	push   %ebp
 321:	89 e5                	mov    %esp,%ebp
 323:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 326:	8b 45 08             	mov    0x8(%ebp),%eax
 329:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 32c:	8b 45 0c             	mov    0xc(%ebp),%eax
 32f:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 332:	eb 17                	jmp    34b <memmove+0x2b>
    *dst++ = *src++;
 334:	8b 45 fc             	mov    -0x4(%ebp),%eax
 337:	8d 50 01             	lea    0x1(%eax),%edx
 33a:	89 55 fc             	mov    %edx,-0x4(%ebp)
 33d:	8b 55 f8             	mov    -0x8(%ebp),%edx
 340:	8d 4a 01             	lea    0x1(%edx),%ecx
 343:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 346:	0f b6 12             	movzbl (%edx),%edx
 349:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 34b:	8b 45 10             	mov    0x10(%ebp),%eax
 34e:	8d 50 ff             	lea    -0x1(%eax),%edx
 351:	89 55 10             	mov    %edx,0x10(%ebp)
 354:	85 c0                	test   %eax,%eax
 356:	7f dc                	jg     334 <memmove+0x14>
  return vdst;
 358:	8b 45 08             	mov    0x8(%ebp),%eax
}
 35b:	c9                   	leave  
 35c:	c3                   	ret    

0000035d <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 35d:	b8 01 00 00 00       	mov    $0x1,%eax
 362:	cd 40                	int    $0x40
 364:	c3                   	ret    

00000365 <exit>:
SYSCALL(exit)
 365:	b8 02 00 00 00       	mov    $0x2,%eax
 36a:	cd 40                	int    $0x40
 36c:	c3                   	ret    

0000036d <wait>:
SYSCALL(wait)
 36d:	b8 03 00 00 00       	mov    $0x3,%eax
 372:	cd 40                	int    $0x40
 374:	c3                   	ret    

00000375 <pipe>:
SYSCALL(pipe)
 375:	b8 04 00 00 00       	mov    $0x4,%eax
 37a:	cd 40                	int    $0x40
 37c:	c3                   	ret    

0000037d <read>:
SYSCALL(read)
 37d:	b8 05 00 00 00       	mov    $0x5,%eax
 382:	cd 40                	int    $0x40
 384:	c3                   	ret    

00000385 <write>:
SYSCALL(write)
 385:	b8 10 00 00 00       	mov    $0x10,%eax
 38a:	cd 40                	int    $0x40
 38c:	c3                   	ret    

0000038d <close>:
SYSCALL(close)
 38d:	b8 15 00 00 00       	mov    $0x15,%eax
 392:	cd 40                	int    $0x40
 394:	c3                   	ret    

00000395 <kill>:
SYSCALL(kill)
 395:	b8 06 00 00 00       	mov    $0x6,%eax
 39a:	cd 40                	int    $0x40
 39c:	c3                   	ret    

0000039d <exec>:
SYSCALL(exec)
 39d:	b8 07 00 00 00       	mov    $0x7,%eax
 3a2:	cd 40                	int    $0x40
 3a4:	c3                   	ret    

000003a5 <open>:
SYSCALL(open)
 3a5:	b8 0f 00 00 00       	mov    $0xf,%eax
 3aa:	cd 40                	int    $0x40
 3ac:	c3                   	ret    

000003ad <mknod>:
SYSCALL(mknod)
 3ad:	b8 11 00 00 00       	mov    $0x11,%eax
 3b2:	cd 40                	int    $0x40
 3b4:	c3                   	ret    

000003b5 <unlink>:
SYSCALL(unlink)
 3b5:	b8 12 00 00 00       	mov    $0x12,%eax
 3ba:	cd 40                	int    $0x40
 3bc:	c3                   	ret    

000003bd <fstat>:
SYSCALL(fstat)
 3bd:	b8 08 00 00 00       	mov    $0x8,%eax
 3c2:	cd 40                	int    $0x40
 3c4:	c3                   	ret    

000003c5 <link>:
SYSCALL(link)
 3c5:	b8 13 00 00 00       	mov    $0x13,%eax
 3ca:	cd 40                	int    $0x40
 3cc:	c3                   	ret    

000003cd <mkdir>:
SYSCALL(mkdir)
 3cd:	b8 14 00 00 00       	mov    $0x14,%eax
 3d2:	cd 40                	int    $0x40
 3d4:	c3                   	ret    

000003d5 <chdir>:
SYSCALL(chdir)
 3d5:	b8 09 00 00 00       	mov    $0x9,%eax
 3da:	cd 40                	int    $0x40
 3dc:	c3                   	ret    

000003dd <dup>:
SYSCALL(dup)
 3dd:	b8 0a 00 00 00       	mov    $0xa,%eax
 3e2:	cd 40                	int    $0x40
 3e4:	c3                   	ret    

000003e5 <getpid>:
SYSCALL(getpid)
 3e5:	b8 0b 00 00 00       	mov    $0xb,%eax
 3ea:	cd 40                	int    $0x40
 3ec:	c3                   	ret    

000003ed <sbrk>:
SYSCALL(sbrk)
 3ed:	b8 0c 00 00 00       	mov    $0xc,%eax
 3f2:	cd 40                	int    $0x40
 3f4:	c3                   	ret    

000003f5 <sleep>:
SYSCALL(sleep)
 3f5:	b8 0d 00 00 00       	mov    $0xd,%eax
 3fa:	cd 40                	int    $0x40
 3fc:	c3                   	ret    

000003fd <uptime>:
SYSCALL(uptime)
 3fd:	b8 0e 00 00 00       	mov    $0xe,%eax
 402:	cd 40                	int    $0x40
 404:	c3                   	ret    

00000405 <hw>:
SYSCALL(hw)
 405:	b8 17 00 00 00       	mov    $0x17,%eax
 40a:	cd 40                	int    $0x40
 40c:	c3                   	ret    

0000040d <fkc>:
SYSCALL(fkc)
 40d:	b8 18 00 00 00       	mov    $0x18,%eax
 412:	cd 40                	int    $0x40
 414:	c3                   	ret    

00000415 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 415:	55                   	push   %ebp
 416:	89 e5                	mov    %esp,%ebp
 418:	83 ec 18             	sub    $0x18,%esp
 41b:	8b 45 0c             	mov    0xc(%ebp),%eax
 41e:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 421:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 428:	00 
 429:	8d 45 f4             	lea    -0xc(%ebp),%eax
 42c:	89 44 24 04          	mov    %eax,0x4(%esp)
 430:	8b 45 08             	mov    0x8(%ebp),%eax
 433:	89 04 24             	mov    %eax,(%esp)
 436:	e8 4a ff ff ff       	call   385 <write>
}
 43b:	c9                   	leave  
 43c:	c3                   	ret    

0000043d <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 43d:	55                   	push   %ebp
 43e:	89 e5                	mov    %esp,%ebp
 440:	56                   	push   %esi
 441:	53                   	push   %ebx
 442:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 445:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 44c:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 450:	74 17                	je     469 <printint+0x2c>
 452:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 456:	79 11                	jns    469 <printint+0x2c>
    neg = 1;
 458:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 45f:	8b 45 0c             	mov    0xc(%ebp),%eax
 462:	f7 d8                	neg    %eax
 464:	89 45 ec             	mov    %eax,-0x14(%ebp)
 467:	eb 06                	jmp    46f <printint+0x32>
  } else {
    x = xx;
 469:	8b 45 0c             	mov    0xc(%ebp),%eax
 46c:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 46f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 476:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 479:	8d 41 01             	lea    0x1(%ecx),%eax
 47c:	89 45 f4             	mov    %eax,-0xc(%ebp)
 47f:	8b 5d 10             	mov    0x10(%ebp),%ebx
 482:	8b 45 ec             	mov    -0x14(%ebp),%eax
 485:	ba 00 00 00 00       	mov    $0x0,%edx
 48a:	f7 f3                	div    %ebx
 48c:	89 d0                	mov    %edx,%eax
 48e:	0f b6 80 c4 0b 00 00 	movzbl 0xbc4(%eax),%eax
 495:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 499:	8b 75 10             	mov    0x10(%ebp),%esi
 49c:	8b 45 ec             	mov    -0x14(%ebp),%eax
 49f:	ba 00 00 00 00       	mov    $0x0,%edx
 4a4:	f7 f6                	div    %esi
 4a6:	89 45 ec             	mov    %eax,-0x14(%ebp)
 4a9:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 4ad:	75 c7                	jne    476 <printint+0x39>
  if(neg)
 4af:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 4b3:	74 10                	je     4c5 <printint+0x88>
    buf[i++] = '-';
 4b5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4b8:	8d 50 01             	lea    0x1(%eax),%edx
 4bb:	89 55 f4             	mov    %edx,-0xc(%ebp)
 4be:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 4c3:	eb 1f                	jmp    4e4 <printint+0xa7>
 4c5:	eb 1d                	jmp    4e4 <printint+0xa7>
    putc(fd, buf[i]);
 4c7:	8d 55 dc             	lea    -0x24(%ebp),%edx
 4ca:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4cd:	01 d0                	add    %edx,%eax
 4cf:	0f b6 00             	movzbl (%eax),%eax
 4d2:	0f be c0             	movsbl %al,%eax
 4d5:	89 44 24 04          	mov    %eax,0x4(%esp)
 4d9:	8b 45 08             	mov    0x8(%ebp),%eax
 4dc:	89 04 24             	mov    %eax,(%esp)
 4df:	e8 31 ff ff ff       	call   415 <putc>
  while(--i >= 0)
 4e4:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 4e8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 4ec:	79 d9                	jns    4c7 <printint+0x8a>
}
 4ee:	83 c4 30             	add    $0x30,%esp
 4f1:	5b                   	pop    %ebx
 4f2:	5e                   	pop    %esi
 4f3:	5d                   	pop    %ebp
 4f4:	c3                   	ret    

000004f5 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 4f5:	55                   	push   %ebp
 4f6:	89 e5                	mov    %esp,%ebp
 4f8:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 4fb:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 502:	8d 45 0c             	lea    0xc(%ebp),%eax
 505:	83 c0 04             	add    $0x4,%eax
 508:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 50b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 512:	e9 7c 01 00 00       	jmp    693 <printf+0x19e>
    c = fmt[i] & 0xff;
 517:	8b 55 0c             	mov    0xc(%ebp),%edx
 51a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 51d:	01 d0                	add    %edx,%eax
 51f:	0f b6 00             	movzbl (%eax),%eax
 522:	0f be c0             	movsbl %al,%eax
 525:	25 ff 00 00 00       	and    $0xff,%eax
 52a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 52d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 531:	75 2c                	jne    55f <printf+0x6a>
      if(c == '%'){
 533:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 537:	75 0c                	jne    545 <printf+0x50>
        state = '%';
 539:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 540:	e9 4a 01 00 00       	jmp    68f <printf+0x19a>
      } else {
        putc(fd, c);
 545:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 548:	0f be c0             	movsbl %al,%eax
 54b:	89 44 24 04          	mov    %eax,0x4(%esp)
 54f:	8b 45 08             	mov    0x8(%ebp),%eax
 552:	89 04 24             	mov    %eax,(%esp)
 555:	e8 bb fe ff ff       	call   415 <putc>
 55a:	e9 30 01 00 00       	jmp    68f <printf+0x19a>
      }
    } else if(state == '%'){
 55f:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 563:	0f 85 26 01 00 00    	jne    68f <printf+0x19a>
      if(c == 'd'){
 569:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 56d:	75 2d                	jne    59c <printf+0xa7>
        printint(fd, *ap, 10, 1);
 56f:	8b 45 e8             	mov    -0x18(%ebp),%eax
 572:	8b 00                	mov    (%eax),%eax
 574:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 57b:	00 
 57c:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 583:	00 
 584:	89 44 24 04          	mov    %eax,0x4(%esp)
 588:	8b 45 08             	mov    0x8(%ebp),%eax
 58b:	89 04 24             	mov    %eax,(%esp)
 58e:	e8 aa fe ff ff       	call   43d <printint>
        ap++;
 593:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 597:	e9 ec 00 00 00       	jmp    688 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 59c:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 5a0:	74 06                	je     5a8 <printf+0xb3>
 5a2:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 5a6:	75 2d                	jne    5d5 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 5a8:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5ab:	8b 00                	mov    (%eax),%eax
 5ad:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 5b4:	00 
 5b5:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 5bc:	00 
 5bd:	89 44 24 04          	mov    %eax,0x4(%esp)
 5c1:	8b 45 08             	mov    0x8(%ebp),%eax
 5c4:	89 04 24             	mov    %eax,(%esp)
 5c7:	e8 71 fe ff ff       	call   43d <printint>
        ap++;
 5cc:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5d0:	e9 b3 00 00 00       	jmp    688 <printf+0x193>
      } else if(c == 's'){
 5d5:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 5d9:	75 45                	jne    620 <printf+0x12b>
        s = (char*)*ap;
 5db:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5de:	8b 00                	mov    (%eax),%eax
 5e0:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 5e3:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 5e7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 5eb:	75 09                	jne    5f6 <printf+0x101>
          s = "(null)";
 5ed:	c7 45 f4 78 09 00 00 	movl   $0x978,-0xc(%ebp)
        while(*s != 0){
 5f4:	eb 1e                	jmp    614 <printf+0x11f>
 5f6:	eb 1c                	jmp    614 <printf+0x11f>
          putc(fd, *s);
 5f8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5fb:	0f b6 00             	movzbl (%eax),%eax
 5fe:	0f be c0             	movsbl %al,%eax
 601:	89 44 24 04          	mov    %eax,0x4(%esp)
 605:	8b 45 08             	mov    0x8(%ebp),%eax
 608:	89 04 24             	mov    %eax,(%esp)
 60b:	e8 05 fe ff ff       	call   415 <putc>
          s++;
 610:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 614:	8b 45 f4             	mov    -0xc(%ebp),%eax
 617:	0f b6 00             	movzbl (%eax),%eax
 61a:	84 c0                	test   %al,%al
 61c:	75 da                	jne    5f8 <printf+0x103>
 61e:	eb 68                	jmp    688 <printf+0x193>
        }
      } else if(c == 'c'){
 620:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 624:	75 1d                	jne    643 <printf+0x14e>
        putc(fd, *ap);
 626:	8b 45 e8             	mov    -0x18(%ebp),%eax
 629:	8b 00                	mov    (%eax),%eax
 62b:	0f be c0             	movsbl %al,%eax
 62e:	89 44 24 04          	mov    %eax,0x4(%esp)
 632:	8b 45 08             	mov    0x8(%ebp),%eax
 635:	89 04 24             	mov    %eax,(%esp)
 638:	e8 d8 fd ff ff       	call   415 <putc>
        ap++;
 63d:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 641:	eb 45                	jmp    688 <printf+0x193>
      } else if(c == '%'){
 643:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 647:	75 17                	jne    660 <printf+0x16b>
        putc(fd, c);
 649:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 64c:	0f be c0             	movsbl %al,%eax
 64f:	89 44 24 04          	mov    %eax,0x4(%esp)
 653:	8b 45 08             	mov    0x8(%ebp),%eax
 656:	89 04 24             	mov    %eax,(%esp)
 659:	e8 b7 fd ff ff       	call   415 <putc>
 65e:	eb 28                	jmp    688 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 660:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 667:	00 
 668:	8b 45 08             	mov    0x8(%ebp),%eax
 66b:	89 04 24             	mov    %eax,(%esp)
 66e:	e8 a2 fd ff ff       	call   415 <putc>
        putc(fd, c);
 673:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 676:	0f be c0             	movsbl %al,%eax
 679:	89 44 24 04          	mov    %eax,0x4(%esp)
 67d:	8b 45 08             	mov    0x8(%ebp),%eax
 680:	89 04 24             	mov    %eax,(%esp)
 683:	e8 8d fd ff ff       	call   415 <putc>
      }
      state = 0;
 688:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 68f:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 693:	8b 55 0c             	mov    0xc(%ebp),%edx
 696:	8b 45 f0             	mov    -0x10(%ebp),%eax
 699:	01 d0                	add    %edx,%eax
 69b:	0f b6 00             	movzbl (%eax),%eax
 69e:	84 c0                	test   %al,%al
 6a0:	0f 85 71 fe ff ff    	jne    517 <printf+0x22>
    }
  }
}
 6a6:	c9                   	leave  
 6a7:	c3                   	ret    

000006a8 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6a8:	55                   	push   %ebp
 6a9:	89 e5                	mov    %esp,%ebp
 6ab:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 6ae:	8b 45 08             	mov    0x8(%ebp),%eax
 6b1:	83 e8 08             	sub    $0x8,%eax
 6b4:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6b7:	a1 e0 0b 00 00       	mov    0xbe0,%eax
 6bc:	89 45 fc             	mov    %eax,-0x4(%ebp)
 6bf:	eb 24                	jmp    6e5 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6c1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6c4:	8b 00                	mov    (%eax),%eax
 6c6:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6c9:	77 12                	ja     6dd <free+0x35>
 6cb:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6ce:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6d1:	77 24                	ja     6f7 <free+0x4f>
 6d3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6d6:	8b 00                	mov    (%eax),%eax
 6d8:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6db:	77 1a                	ja     6f7 <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6dd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6e0:	8b 00                	mov    (%eax),%eax
 6e2:	89 45 fc             	mov    %eax,-0x4(%ebp)
 6e5:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6e8:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6eb:	76 d4                	jbe    6c1 <free+0x19>
 6ed:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6f0:	8b 00                	mov    (%eax),%eax
 6f2:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6f5:	76 ca                	jbe    6c1 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 6f7:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6fa:	8b 40 04             	mov    0x4(%eax),%eax
 6fd:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 704:	8b 45 f8             	mov    -0x8(%ebp),%eax
 707:	01 c2                	add    %eax,%edx
 709:	8b 45 fc             	mov    -0x4(%ebp),%eax
 70c:	8b 00                	mov    (%eax),%eax
 70e:	39 c2                	cmp    %eax,%edx
 710:	75 24                	jne    736 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 712:	8b 45 f8             	mov    -0x8(%ebp),%eax
 715:	8b 50 04             	mov    0x4(%eax),%edx
 718:	8b 45 fc             	mov    -0x4(%ebp),%eax
 71b:	8b 00                	mov    (%eax),%eax
 71d:	8b 40 04             	mov    0x4(%eax),%eax
 720:	01 c2                	add    %eax,%edx
 722:	8b 45 f8             	mov    -0x8(%ebp),%eax
 725:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 728:	8b 45 fc             	mov    -0x4(%ebp),%eax
 72b:	8b 00                	mov    (%eax),%eax
 72d:	8b 10                	mov    (%eax),%edx
 72f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 732:	89 10                	mov    %edx,(%eax)
 734:	eb 0a                	jmp    740 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 736:	8b 45 fc             	mov    -0x4(%ebp),%eax
 739:	8b 10                	mov    (%eax),%edx
 73b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 73e:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 740:	8b 45 fc             	mov    -0x4(%ebp),%eax
 743:	8b 40 04             	mov    0x4(%eax),%eax
 746:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 74d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 750:	01 d0                	add    %edx,%eax
 752:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 755:	75 20                	jne    777 <free+0xcf>
    p->s.size += bp->s.size;
 757:	8b 45 fc             	mov    -0x4(%ebp),%eax
 75a:	8b 50 04             	mov    0x4(%eax),%edx
 75d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 760:	8b 40 04             	mov    0x4(%eax),%eax
 763:	01 c2                	add    %eax,%edx
 765:	8b 45 fc             	mov    -0x4(%ebp),%eax
 768:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 76b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 76e:	8b 10                	mov    (%eax),%edx
 770:	8b 45 fc             	mov    -0x4(%ebp),%eax
 773:	89 10                	mov    %edx,(%eax)
 775:	eb 08                	jmp    77f <free+0xd7>
  } else
    p->s.ptr = bp;
 777:	8b 45 fc             	mov    -0x4(%ebp),%eax
 77a:	8b 55 f8             	mov    -0x8(%ebp),%edx
 77d:	89 10                	mov    %edx,(%eax)
  freep = p;
 77f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 782:	a3 e0 0b 00 00       	mov    %eax,0xbe0
}
 787:	c9                   	leave  
 788:	c3                   	ret    

00000789 <morecore>:

static Header*
morecore(uint nu)
{
 789:	55                   	push   %ebp
 78a:	89 e5                	mov    %esp,%ebp
 78c:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 78f:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 796:	77 07                	ja     79f <morecore+0x16>
    nu = 4096;
 798:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 79f:	8b 45 08             	mov    0x8(%ebp),%eax
 7a2:	c1 e0 03             	shl    $0x3,%eax
 7a5:	89 04 24             	mov    %eax,(%esp)
 7a8:	e8 40 fc ff ff       	call   3ed <sbrk>
 7ad:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 7b0:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 7b4:	75 07                	jne    7bd <morecore+0x34>
    return 0;
 7b6:	b8 00 00 00 00       	mov    $0x0,%eax
 7bb:	eb 22                	jmp    7df <morecore+0x56>
  hp = (Header*)p;
 7bd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7c0:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 7c3:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7c6:	8b 55 08             	mov    0x8(%ebp),%edx
 7c9:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 7cc:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7cf:	83 c0 08             	add    $0x8,%eax
 7d2:	89 04 24             	mov    %eax,(%esp)
 7d5:	e8 ce fe ff ff       	call   6a8 <free>
  return freep;
 7da:	a1 e0 0b 00 00       	mov    0xbe0,%eax
}
 7df:	c9                   	leave  
 7e0:	c3                   	ret    

000007e1 <malloc>:

void*
malloc(uint nbytes)
{
 7e1:	55                   	push   %ebp
 7e2:	89 e5                	mov    %esp,%ebp
 7e4:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7e7:	8b 45 08             	mov    0x8(%ebp),%eax
 7ea:	83 c0 07             	add    $0x7,%eax
 7ed:	c1 e8 03             	shr    $0x3,%eax
 7f0:	83 c0 01             	add    $0x1,%eax
 7f3:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 7f6:	a1 e0 0b 00 00       	mov    0xbe0,%eax
 7fb:	89 45 f0             	mov    %eax,-0x10(%ebp)
 7fe:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 802:	75 23                	jne    827 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 804:	c7 45 f0 d8 0b 00 00 	movl   $0xbd8,-0x10(%ebp)
 80b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 80e:	a3 e0 0b 00 00       	mov    %eax,0xbe0
 813:	a1 e0 0b 00 00       	mov    0xbe0,%eax
 818:	a3 d8 0b 00 00       	mov    %eax,0xbd8
    base.s.size = 0;
 81d:	c7 05 dc 0b 00 00 00 	movl   $0x0,0xbdc
 824:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 827:	8b 45 f0             	mov    -0x10(%ebp),%eax
 82a:	8b 00                	mov    (%eax),%eax
 82c:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 82f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 832:	8b 40 04             	mov    0x4(%eax),%eax
 835:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 838:	72 4d                	jb     887 <malloc+0xa6>
      if(p->s.size == nunits)
 83a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 83d:	8b 40 04             	mov    0x4(%eax),%eax
 840:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 843:	75 0c                	jne    851 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 845:	8b 45 f4             	mov    -0xc(%ebp),%eax
 848:	8b 10                	mov    (%eax),%edx
 84a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 84d:	89 10                	mov    %edx,(%eax)
 84f:	eb 26                	jmp    877 <malloc+0x96>
      else {
        p->s.size -= nunits;
 851:	8b 45 f4             	mov    -0xc(%ebp),%eax
 854:	8b 40 04             	mov    0x4(%eax),%eax
 857:	2b 45 ec             	sub    -0x14(%ebp),%eax
 85a:	89 c2                	mov    %eax,%edx
 85c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 85f:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 862:	8b 45 f4             	mov    -0xc(%ebp),%eax
 865:	8b 40 04             	mov    0x4(%eax),%eax
 868:	c1 e0 03             	shl    $0x3,%eax
 86b:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 86e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 871:	8b 55 ec             	mov    -0x14(%ebp),%edx
 874:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 877:	8b 45 f0             	mov    -0x10(%ebp),%eax
 87a:	a3 e0 0b 00 00       	mov    %eax,0xbe0
      return (void*)(p + 1);
 87f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 882:	83 c0 08             	add    $0x8,%eax
 885:	eb 38                	jmp    8bf <malloc+0xde>
    }
    if(p == freep)
 887:	a1 e0 0b 00 00       	mov    0xbe0,%eax
 88c:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 88f:	75 1b                	jne    8ac <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 891:	8b 45 ec             	mov    -0x14(%ebp),%eax
 894:	89 04 24             	mov    %eax,(%esp)
 897:	e8 ed fe ff ff       	call   789 <morecore>
 89c:	89 45 f4             	mov    %eax,-0xc(%ebp)
 89f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8a3:	75 07                	jne    8ac <malloc+0xcb>
        return 0;
 8a5:	b8 00 00 00 00       	mov    $0x0,%eax
 8aa:	eb 13                	jmp    8bf <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8ac:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8af:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8b2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8b5:	8b 00                	mov    (%eax),%eax
 8b7:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 8ba:	e9 70 ff ff ff       	jmp    82f <malloc+0x4e>
}
 8bf:	c9                   	leave  
 8c0:	c3                   	ret    
