			global		_ft_strcmp

			section		.text
_ft_strcmp:
			xor				rcx, rcx			; set index to 0
loop:
			movzx				rax, byte [rdi + rcx]	; we use movzx instead of move, to zero out rest of memory (we only copy 1 byte into a 4 byte register)
			movzx				rdx, byte [rsi + rcx]	; put current chars in registers
			cmp				rax, rdx				; compare characters
			jne				end
			inc				rcx						; go to next index
			cmp				rax, 0					; check if its the end of s1
			jnz				loop					; if not, go to start of loop
end:
			sub rax, rdx
			ret