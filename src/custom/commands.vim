" Clear Registers
command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor

" Delete specific line and jump back to previous line
command! -range -nargs=0 D <line1>,<line2>d|norm ``
