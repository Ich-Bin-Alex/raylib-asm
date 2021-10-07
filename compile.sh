as --defsym _LINUX_=1 game.asm -o game.o
gcc -L. game.o -o game -lraylib -ldl -lm -lpthread
rm game.o
chmod +x game