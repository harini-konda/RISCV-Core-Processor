
program.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <main>:
   0:	fe010113          	addi	sp,sp,-32
   4:	00112e23          	sw	ra,28(sp)
   8:	00812c23          	sw	s0,24(sp)
   c:	02010413          	addi	s0,sp,32
  10:	00200793          	li	a5,2
  14:	fef42623          	sw	a5,-20(s0)
  18:	00400793          	li	a5,4
  1c:	fef42423          	sw	a5,-24(s0)
  20:	fec42703          	lw	a4,-20(s0)
  24:	fe842783          	lw	a5,-24(s0)
  28:	00f707b3          	add	a5,a4,a5
  2c:	fef42223          	sw	a5,-28(s0)
  30:	fe442783          	lw	a5,-28(s0)
  34:	00179793          	slli	a5,a5,0x1
  38:	fef42223          	sw	a5,-28(s0)
  3c:	fe442703          	lw	a4,-28(s0)
  40:	fec42783          	lw	a5,-20(s0)
  44:	40f707b3          	sub	a5,a4,a5
  48:	fef42223          	sw	a5,-28(s0)
  4c:	fe442783          	lw	a5,-28(s0)
  50:	0017c793          	xori	a5,a5,1
  54:	fef42223          	sw	a5,-28(s0)
  58:	fe442783          	lw	a5,-28(s0)
  5c:	fef42023          	sw	a5,-32(s0)
  60:	fe442783          	lw	a5,-28(s0)
  64:	00078513          	mv	a0,a5
  68:	01c12083          	lw	ra,28(sp)
  6c:	01812403          	lw	s0,24(sp)
  70:	02010113          	addi	sp,sp,32
  74:	00008067          	ret
