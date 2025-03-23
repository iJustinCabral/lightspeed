package game

import rl "vendor:raylib"
import "core:fmt"

WINDOW_WIDTH  :: 480 * 2 
WINDOW_HEIGHT :: 360 * 2

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
	
    }

}
