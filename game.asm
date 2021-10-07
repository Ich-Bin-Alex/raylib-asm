.include "tools.asm"

START
	mov $512, par1.32
	mov $512, par2.32
	lea WindowTitle(rip), par3
	call InitWindow

	mainLoop:
		call BeginDrawing

		mov $0xffffffff, par1.32
		call ClearBackground

		mov $512-64, r15d
		circleLoop:
			mov r15d, par1.32
			mov $512/2, par2.32
			mov $0xff00b0ff, par3.32
			movss CircleRadius(rip), xmm0
			call DrawCircle
			sub $64, r15d
			jnz circleLoop

		call EndDrawing

		call WindowShouldClose
		test eax, eax
		jz mainLoop
EXIT

WindowTitle: .string "Hello from Raylib & x64 Asm :)"
CircleRadius: .single 15.0
