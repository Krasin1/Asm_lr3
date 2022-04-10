all: cmp.o vvod.o code1.o in_out.o
	ld cmp.o vvod.o code1.o in_out.o  -o cmp -g 

cmp.o: cmp.asm
	yasm -f elf64 cmp.asm -o cmp.o -g dwarf2

vvod.o: vvod.asm
	yasm -f elf64 vvod.asm -o vvod.o -g dwarf2

code1.o: code1.asm
	yasm -f elf64 code1.asm -o code1.o -g dwarf2

in_out.o: in_out.asm
	yasm -f elf64 in_out.asm -o in_out.o -g dwarf2

clean:
	rm *.o && rm cmp
