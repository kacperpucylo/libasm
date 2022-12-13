			global		_ft_read
			extern		__errno_location

			section		.text
_ft_read:
			mov			rax, 0x02000003		; syscall read
			syscall
			cmp			rax, 0				; compare return value with 0
			jl			error				; if less than 0, jump to error
			ret
error:
			neg			rax					; get errno value
			mov			rdi, rax			; save errno value
			call		__errno_location	; save pointer to errno in rax
			mov			[rax], rdi			; put errno value in errno address
			mov			rax, -1				; set return value to -1
			ret