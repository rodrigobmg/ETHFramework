﻿class GameState : BaseState
{
	private string m_sceneName;
	private vector2 m_menuButtonNormPos;
	private GameLayer@ m_gameLayer;
	private GameMenuLayer@ m_gameMenuLayer;

	GameState(const string &in sceneName, const vector2 &in menuButtonNormPos)
	{
		m_sceneName = sceneName;
		m_menuButtonNormPos = menuButtonNormPos;
	}

	void start()
	{
		BaseState::start();
		loadScene(m_sceneName);
	}

	void preLoop()
	{
		BaseState::preLoop();
		@m_gameLayer = GameLayer(m_menuButtonNormPos);
		@m_gameMenuLayer = GameMenuLayer();
		
		m_layerManager.addLayer(@m_gameLayer);
		m_layerManager.addLayer(@m_gameMenuLayer);

		m_layerManager.setCurrentLayer("GameLayer");
	}

	void loop()
	{
		BaseState::loop();
		if (m_gameLayer.isButtonPressed("menu_button"))
		{
			m_gameLayer.setButtonPressed("menu_button", false);
			m_layerManager.setCurrentLayer("GameMenuLayer");
		}
		if (m_gameMenuLayer.isButtonPressed("resume_button"))
		{
			m_gameMenuLayer.setButtonPressed("resume_button", false);
			m_gameMenuLayer.hide(true);
			m_layerManager.setCurrentLayer("GameLayer");
		}
	}

	string getName()
	{
		return "GameState";
	}
}

class GameLayer : UILayer
{
	GameLayer(const vector2 &in menuButtonNormPos)
	{
		// addButton parameters: button name id, sprite file name, normalized pos, normalized origin
		addButton("menu_button", "sprites/main_menu_shortcut.png", menuButtonNormPos, menuButtonNormPos);
	}

	void update()
	{
		UILayer::update();
	}

	string getName() const
	{
		return "GameLayer";
	}
}

class GameMenuLayer : UILayer
{
	GameMenuLayer()
	{
		addSprite("sprites/square.png", ARGB(155,0,0,0), V2_ZERO, GetScreenSize(), V2_ZERO);
		addButton("back_button",   "sprites/back_to_main_menu.png", vector2(0.5f, 0.35f));
		addButton("resume_button", "sprites/resume_button.png",     vector2(0.5f, 0.65f));
	}

	void update()
	{
		UILayer::update();
		if (isButtonPressed("back_button"))
		{
			setButtonPressed("back_button", false);
			g_stateManager.setState(createMenuState());
			hide(true);
		}
	}

	string getName() const
	{
		return "GameMenuLayer";
	}
}
