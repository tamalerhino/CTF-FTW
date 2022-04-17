Reverse Engineering
-------------------

* [ltrace](http://man7.org/linux/man-pages/man1/ltrace.1.html) and [strace](https://strace.io)

	Easy command-line tools to see some of the code being executed as you follow through a binary. Usage: `ltrace ./binary`

* [Hopper](https://www.hopperapp.com)

	Hopper Disassembler, the reverse engineering tool that lets you disassemble, decompile and debug your applications.

* [Binary Ninja](https://binary.ninja)

	Clean and easy with multithreaded analysis. Support multiple architectures, platforms, and compilers.

* [gdb](https://en.wikipedia.org/wiki/GNU_Debugger)

	Fast and powerful debugger for UNIX system. More powerful if this tool is equipped with [PEDA](https://github.com/longld/peda).

* [IDA](https://www.hex-rays.com/products/ida/support/download.shtml)

	It's one of popular debugger and disassembler tool with rich of features, cross platform, multi-processor disassembler.

* [radare2](https://github.com/radareorg/radare2)

	Portable tool for hex editor, binary analysis, disassembler, debugger, etc.

* [Ghidra](https://ghidra-sre.org/)

	New RE tool developed by NSA with the same feature as IDA

* Compiling & running ASM code:

	You can convert ASM functions from assembly and run them as C functions like the following:

	`asm4.S`
	```asm
	.intel_syntax noprefix
	.global asm4
	asm4:
		push   ebp
		mov    ebp,esp
		push   ebx
		sub    esp,0x10
		mov    DWORD PTR [ebp-0x10],0x27d
		mov    DWORD PTR [ebp-0xc],0x0
		jmp    label2
	label1:
		add    DWORD PTR [ebp-0xc],0x1
	label2:
		mov    edx,DWORD PTR [ebp-0xc]
		mov    eax,DWORD PTR [ebp+0x8]
		add    eax,edx
		movzx  eax,BYTE PTR [eax]
		test   al,al
		jne    label1
		mov    DWORD PTR [ebp-0x8],0x1
		jmp    label3
	label4:
		mov    edx,DWORD PTR [ebp-0x8]
		mov    eax,DWORD PTR [ebp+0x8]
		add    eax,edx
		movzx  eax,BYTE PTR [eax]
		movsx  edx,al
		mov    eax,DWORD PTR [ebp-0x8]
		lea    ecx,[eax-0x1]
		mov    eax,DWORD PTR [ebp+0x8]
		add    eax,ecx
		movzx  eax,BYTE PTR [eax]
		movsx  eax,al
		sub    edx,eax
		mov    eax,edx
		mov    edx,eax
		mov    eax,DWORD PTR [ebp-0x10]
		lea    ebx,[edx+eax*1]
		mov    eax,DWORD PTR [ebp-0x8]
		lea    edx,[eax+0x1]
		mov    eax,DWORD PTR [ebp+0x8]
		add    eax,edx
		movzx  eax,BYTE PTR [eax]
		movsx  edx,al
		mov    ecx,DWORD PTR [ebp-0x8]
		mov    eax,DWORD PTR [ebp+0x8]
		add    eax,ecx
		movzx  eax,BYTE PTR [eax]
		movsx  eax,al
		sub    edx,eax
		mov    eax,edx
		add    eax,ebx
		mov    DWORD PTR [ebp-0x10],eax
		add    DWORD PTR [ebp-0x8],0x1
	label3:
		mov    eax,DWORD PTR [ebp-0xc]
		sub    eax,0x1
		cmp    DWORD PTR [ebp-0x8],eax
		jl     label4
		mov    eax,DWORD PTR [ebp-0x10]
		add    esp,0x10
		pop    ebx
		pop    ebp
		ret
	```

	`asm4.c`
	```c
	#include<stdio.h>
	extern int asm4(char* s);

	int main(){
	    char *str = "picoCTF_d899a";
	    printf("%X", asm4(str));
	    return 0;
	}
	```
	`bash`
	```bash
	$ gcc -m32 -o a asm4.c asm4.S
	$ ./a
	```