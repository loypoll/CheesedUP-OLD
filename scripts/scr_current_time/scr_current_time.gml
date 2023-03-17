function scr_current_time() {
	return REMIX ? ((global.time / 60) * 1000) : current_time;
}
