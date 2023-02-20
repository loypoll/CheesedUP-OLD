function sh_oobcam()
{
	WC_oobcam = !WC_oobcam;
	if !isOpen
		create_transformation_tip("{s}Limitless camera " + (WC_oobcam ? "ON" : "OFF") + "/");
	else
		return "Limitless camera " + (WC_oobcam ? "ON" : "OFF");
}
function meta_oobcam()
{
	return {
		description: "toggles the limitless camera",
	}
}
