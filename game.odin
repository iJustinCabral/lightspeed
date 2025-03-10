package game

import rl "vendor:raylib"
import "core:fmt"

WINDOW_WIDTH  :: 480 * 2 
WINDOW_HEIGHT :: 360 * 2



Game_State :: struct {

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

	// Full screen toggle  TODO: Change the key from KP_0 to a universal key used on multiple platforms F11?
	if IsKeyPressed(.KP_0) {

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
