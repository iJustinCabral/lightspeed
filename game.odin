package game

import rl "vendor:raylib"
import "core:fmt"

WINDOW_WIDTH    :: 480 * 2 
WINDOW_HEIGHT   :: 360 * 2
WINDOW_CENTER_X :: WINDOW_WIDTH / 2
WINDOW_CENTER_Y :: WINDOW_HEIGHT / 2

Game_State :: struct {

}

Game_Memory :: struct {

}

Player :: struct {

}

main :: proc() {
    using rl

    SetConfigFlags(ConfigFlags{.WINDOW_RESIZABLE, .VSYNC_HINT})
    SetTargetFPS(60)

    InitWindow(WINDOW_WIDTH, WINDOW_HEIGHT, "Lightspeed")
    SetWindowMinSize(WINDOW_WIDTH, WINDOW_HEIGHT)

    display := GetCurrentMonitor()

    defer CloseWindow()

    for !WindowShouldClose() {

	if IsKeyPressed(.F11) {

	    if IsWindowFullscreen() {
		SetWindowSize(WINDOW_WIDTH, WINDOW_HEIGHT)	
	    }
	    else {
		SetWindowSize(GetMonitorWidth(display), GetMonitorHeight(display))
	    }

	    ToggleFullscreen()
	}
	
	
	BeginDrawing()
	defer EndDrawing()

	ClearBackground(rl.BLACK)
	text := fmt.ctprint("Lightspeed ahead!")
	text_size := MeasureText(text, 20)
	DrawText(text, WINDOW_CENTER_X - text_size / 2, WINDOW_CENTER_Y, 20, rl.WHITE)
	
	
    }

}
