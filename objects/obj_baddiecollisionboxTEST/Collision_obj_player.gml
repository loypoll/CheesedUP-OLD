if (baddieID.state != states.grabbed && baddieID.state != 154)
{
	var _playerinst = other.id;
	baddiecollisionbox_update(_playerinst);
}
