as.exe --defsym _WINDOWS_=1 game.asm -o game.o
gcc.exe game.o -o game.exe -lraylib -lopengl32 -lgdi32 -lwinmm
del game.o