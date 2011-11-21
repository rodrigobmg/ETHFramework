﻿funcdef bool PERFORM_ACTION(const uint itemIdx);
funcdef bool VALIDATE_ITEM(const uint itemIdx);
funcdef void ITEM_DRAW_CALLBACK(const uint index, const vector2 &in pos, const vector2 &in offset);

bool defaultItemValidation(const uint itemIdx) { return true; }
void defaultDrawCallback(const uint index, const vector2 &in pos, const vector2 &in offset) { }

class PageProperties
{
	PageProperties()
	{
		numItems = 35;
		columns = 4;
		rows = 3;
		font = "Verdana64_shadow.fnt";
		numberOffset = vector2(0, 0);
		@performAction = @levelChooser;
		@validateItem  = @defaultItemValidation;
		@itemDrawCallback  = @defaultDrawCallback;
		backButtonNormPos		= vector2(0.0f, 0.5f);
		forwardButtonNormPos	= vector2(1.0f, 0.5f);
		buttonName		= "ETHFramework/sprites/level_select_icon.png";
		lockedButton	= "ETHFramework/sprites/level_select_lock_icon.png";
		emptyButton		= "ETHFramework/sprites/level_select_icon.png";
		backButton		= "ETHFramework/sprites/level_select_back.png";
		forwardButton	= "ETHFramework/sprites/level_select_forward.png";
		useUniqueButtons = false;
		buttonSufix = "";
		showNumbers = true;
	}
	uint numItems;
	uint columns;
	uint rows;
	string font;
	vector2 numberOffset;
	vector2 backButtonNormPos;
	vector2 forwardButtonNormPos;
	PERFORM_ACTION@ performAction;
	VALIDATE_ITEM@ validateItem;
	ITEM_DRAW_CALLBACK@ itemDrawCallback;
	string buttonName;
	string lockedButton;
	string emptyButton;
	string backButton;
	string forwardButton;
	string buttonSufix;
	bool useUniqueButtons;
	bool showNumbers;
}
