function scr_keyname()
{
	switch (argument0)
	{
		case 38:
			return "UP";
			break;
		case 39:
			return "RIGHT";
			break;
		case 37:
			return "LEFT";
			break;
		case 40:
			return "DOWN";
			break;
		case 13:
			return "ENTER";
			break;
		case 27:
			return "ESCAPE";
			break;
		case 32:
			return "SPACE";
			break;
		case states.boss_shoulderturn:
			return "SHIFT";
			break;
		case 160:
			return "SHIFT";
			break;
		case 16:
			return "SHIFT";
			break;
		case 17:
			return "CONTROL";
			break;
		case 162:
			return "CONTROL";
			break;
		case 163:
			return "CONTROL";
			break;
		case 18:
			return "ALT";
			break;
		case 164:
			return "ALT";
			break;
		case 8:
			return "BACKSPACE";
			break;
		case 9:
			return "TAB";
			break;
		case 36:
			return "HOME";
			break;
		case 35:
			return "END";
			break;
		case 46:
			return "DELETE";
			break;
		case 45:
			return "INSERT";
			break;
		case 33:
			return "PAGE UP";
			break;
		case 34:
			return "PAGE DOWN";
			break;
		case 19:
			return "PAUSE";
			break;
		case 44:
			return "PRINTSCREEN";
			break;
		case 112:
			return "F1";
			break;
		case 113:
			return "F2";
			break;
		case 114:
			return "F3";
			break;
		case 115:
			return "F4";
			break;
		case 116:
			return "F5";
			break;
		case 117:
			return "F6";
			break;
		case 118:
			return "F7";
			break;
		case 119:
			return "F8";
			break;
		case 120:
			return "F9";
			break;
		case 121:
			return "F10";
			break;
		case states.freefallprep:
			return "F11";
			break;
		case 123:
			return "F12";
			break;
		case 96:
			return "NUMPAD 0";
			break;
		case 97:
			return "NUMPAD 1";
			break;
		case 98:
			return "NUMPAD 2";
			break;
		case 99:
			return "NUMPAD 3";
			break;
		case 100:
			return "NUMPAD 4";
			break;
		case 101:
			return "NUMPAD 5";
			break;
		case 102:
			return "NUMPAD 6";
			break;
		case 103:
			return "NUMPAD 7";
			break;
		case states.mach2:
			return "NUMPAD 8";
			break;
		case 105:
			return "NUMPAD 9";
			break;
		case 106:
			return "MULTIPLY";
			break;
		case states.freefallland:
			return "DIVIDE";
			break;
		case 107:
			return "ADD";
			break;
		case 109:
			return "SUBTRACT";
			break;
		case 110:
			return "DECIMAL";
			break;
		case -1:
			return "PRESS A KEY";
			break;
	}
	switch (argument0)
	{
		case 8:
			return "BACKSPACE";
			break;
		case 9:
			return "TAB";
			break;
		case 13:
			return "ENTER";
			break;
		case 19:
			return "PAUSE";
			break;
		case 20:
			return "CAPS LOCK";
			break;
		case 27:
			return "ESC";
			break;
		case 32:
			return "SPACE";
			break;
		case 33:
			return "PAGEUP";
			break;
		case 34:
			return "PAGEDOWN";
			break;
		case 35:
			return "END";
			break;
		case 36:
			return "HOME";
			break;
		case 37:
			return "LEFT";
			break;
		case 38:
			return "UP";
			break;
		case 39:
			return "RIGHT";
			break;
		case 40:
			return "DOWN";
			break;
		case 45:
			return "INSERT";
			break;
		case 46:
			return "DELETE";
			break;
		case 48:
			return "0";
			break;
		case 49:
			return "1";
			break;
		case 50:
			return "2";
			break;
		case 51:
			return "3";
			break;
		case 52:
			return "4";
			break;
		case 53:
			return "5";
			break;
		case 54:
			return "6";
			break;
		case 55:
			return "7";
			break;
		case 56:
			return "8";
			break;
		case 57:
			return "9";
			break;
		case 65:
			return "A";
			break;
		case states.shotgun:
			return "B";
			break;
		case 67:
			return "C";
			break;
		case 68:
			return "D";
			break;
		case 69:
			return "E";
			break;
		case 70:
			return "F";
			break;
		case 71:
			return "G";
			break;
		case 72:
			return "H";
			break;
		case 73:
			return "I";
			break;
		case states.throwing:
			return "J";
			break;
		case 75:
			return "K";
			break;
		case 76:
			return "L";
			break;
		case states.skateboard:
			return "M";
			break;
		case 78:
			return "N";
			break;
		case 79:
			return "O";
			break;
		case states.punch:
			return "P";
			break;
		case 81:
			return "Q";
			break;
		case 82:
			return "R";
			break;
		case 83:
			return "S";
			break;
		case states.backbreaker:
			return "T";
			break;
		case 85:
			return "U";
			break;
		case 86:
			return "V";
			break;
		case 87:
			return "W";
			break;
		case 88:
			return "X";
			break;
		case 89:
			return "Y";
			break;
		case 90:
			return "Z";
			break;
		case 91:
			return "LEXPLR";
			break;
		case states.jump:
			return "REXPLR";
			break;
		case 96:
			return "NUMPAD 0";
			break;
		case 97:
			return "NUMPAD 1";
			break;
		case 98:
			return "NUMPAD 2";
			break;
		case 99:
			return "NUMPAD 3";
			break;
		case 100:
			return "NUMPAD 4";
			break;
		case 101:
			return "NUMPAD 5";
			break;
		case 102:
			return "NUMPAD 6";
			break;
		case 103:
			return "NUMPAD 7";
			break;
		case states.mach2:
			return "NUMPAD 8";
			break;
		case 105:
			return "NUMPAD 9";
			break;
		case 106:
			return "ASTERISK";
			break;
		case 107:
			return "ADD";
			break;
		case 109:
			return "DIVIDE";
			break;
		case 110:
			return "DOT";
			break;
		case states.freefallland:
			return "SLASH";
			break;
		case 112:
			return "F1";
			break;
		case 113:
			return "F2";
			break;
		case 114:
			return "F3";
			break;
		case 115:
			return "F4";
			break;
		case 116:
			return "F5";
			break;
		case 117:
			return "F6";
			break;
		case 118:
			return "F7";
			break;
		case 119:
			return "F8";
			break;
		case 120:
			return "F9";
			break;
		case 121:
			return "F10";
			break;
		case states.freefallprep:
			return "F11";
			break;
		case 123:
			return "F12";
			break;
		case states.arenaintro:
			return "NUMLCK";
			break;
		case 145:
			return "SCROLLLCK";
			break;
		case 160:
			return "LSHIFT";
			break;
		case states.boss_shoulderturn:
			return "RSHIFT";
			break;
		case 162:
			return "LCTRL";
			break;
		case 163:
			return "RCTRL";
			break;
		case 164:
			return "LALT";
			break;
		case 165:
			return "RALT";
			break;
		case 186:
			return "SEMICOLON";
			break;
		case 187:
			return "EQUAL";
			break;
		case 188:
			return "COMMA";
			break;
		case 189:
			return "UNDERSCR";
			break;
		case 190:
			return "DOT";
			break;
		case 191:
			return "SLASH";
			break;
		case 192:
			return "TILDE";
			break;
		case 219:
			return "LBRACKET";
			break;
		case 220:
			return "VERTBAR";
			break;
		case 221:
			return "RBRACKET";
			break;
		case 222:
			return "APOSTRPH";
			break;
	}
	return chr(argument0);
}
