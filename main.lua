-- Main.Lua 
-- LÖVE (Love2d) 0.9.0 Game Development Framework Callback Function Template
--
-- Provided by Eamonn Rea, 2014
require"TEsound"

function love.load()
	-- Tables
	Settings = {}
	Settings['version'] = "0.03"
	Settings['state'] = "LOADING"
	Settings['console'] = 1
	Settings['FPS'] = 1
	Settings['time'] = 1
	Settings['volume'] = 0.25
	Settings['fontsize'] = 16
	Settings['font'] = love.graphics.newFont("Resources/Files/Font.ttf", Settings['fontsize'] )
	Settings['chat_font'] = love.graphics.newFont("Resources/Files/Chat_Font.ttf", Settings['fontsize'] )
	
	Screen = {}
    Screen['w'] = love.graphics.getWidth()
    Screen['h'] = love.graphics.getHeight()
	Screen['opacity'] = 255
	
	Images = {}
	Images['lua_logo'] = love.graphics.newImage('Resources/Images/Lua_Logo.png')
	Images['love_logo'] = love.graphics.newImage('Resources/Images/Love_Logo.png')
	Images['openal_logo'] = love.graphics.newImage('Resources/Images/OpenAL_Logo.png')
	Images['opengl_logo'] = love.graphics.newImage('Resources/Images/OpenGL_Logo.png')
	Images['odnsrvns_logo'] = love.graphics.newImage('Resources/Images/Odnsrvns_Logo.png')
	Images['wallpaper'] = love.graphics.newImage('Resources/Images/Wallpaper.png')
	Images['title'] = love.graphics.newImage('Resources/Images/Title_Logo.png')
	Images['d20'] = love.graphics.newImage('Resources/Images/d20.png')


	Sounds = {}
	Sounds['intro'] = "Resources/Audio/Intro.mp3"
	Sounds['click'] = "Resources/Audio/Click.wav"
	TEsound.playLooping(Sounds['intro'], {"intro"}, Settings['volume'])
	
	Player1 = {}
	Player1['name'] = "Player1"
	Player1['level'] = 1
	Player1['xp'] = 0
	Player1['gold'] = 0
	Player1['health'] = 100
	Player1['armor'] = 0
	Player1['speed'] = 100
	Player1['h'] = 100
	Player1['w'] = 100
	Player1['inventory'] = "Empty"
	Player1['input'] = "Press [enter] to Begin..."
	Player1['state'] = "INTRO"
	
	Button = {}
	
	Button['rcolor'] = 255
	Button['bcolor'] = 255
	Button['gcolor'] = 255
	Button['opacity']= 150
	Button['x'] = 1
	Button['y'] = 1
	Button['h'] = 1
	Button['w'] = 1
	Button['fontsize'] = 64 
	Button['font'] = love.graphics.newFont("Resources/Files/Font.ttf", Button['fontsize'] )
	Button['click'] = 1
	
	Mouse = {}
	
	Mouse['x'] = Screen['w']
	Mouse['y'] = Screen['h']
	
	System = {}
	System['output'] 		= "System Output..."
	System['textbox']		= "! So the game begins"
	System['intromsg']		= "Welcome to Along the Brume Spoor a text based RPG. \n Use /help to view all the games commands. Enjoy your game!"
	System['/help'] 			= "/help"
	System['/settings'] 	= "/settings"
	System['/save'] 		= "/save"
	System['/quit'] 			= "/quit"
	System['/inventory'] 	= "/inventory"
	System['/look'] 			= "/look"
	System['/search'] 		= "/search"
	System['/listen'] 		= "/listen"
	System['/move'] 		= "/move"
	System['/attack'] 		= "/attack"
	System['/hide'] 			= "/hide"
	System['/escape'] 		= "/escape"
	System['/disable'] 		= "/disable"
	System['/heal'] 			= "/heal"
	System['/open'] 		= "/open"
	System['/close'] 		= "/close"
	System['/lock'] 			= "/lock"
	System['/unlock']	 	= "/unlock"
	System['/buy'] 			= "/buy"
	System['/sell'] 			= "/sell"
	System['/trade'] 		= "/trade"
	System['/take'] 			= "/take"
	System['/drop'] 		= "/drop"
	System['/sleep'] 		= "/sleep"
	System['/eat'] 			= "/eat"
	System['/drink'] 		= "/drink"
	
	-- Love Settings 
	love.keyboard.setKeyRepeat(true)
	

end

function love.update( dt )
	TEsound.cleanup()
	Settings['time'] = Settings['time'] + dt
	love.graphics.setFont(Settings['font'])
	Mouse['x'] = love.mouse.getX()
	Mouse['y'] = love.mouse.getY()
	Mouse['r'] = love.mouse.isDown("r")
	Mouse['l'] = love.mouse.isDown("l")
	System['textbox_strings']  = select(2, System['textbox']:gsub('\n', '\n'))
	
	if Settings['state'] == "LOADING" then
		
		if Screen['opacity'] == 255 then Screen['opacity'] = Settings['time'] * 8 end
		if Screen['opacity'] < 255 then Screen['opacity'] = Settings['time'] * 8 end
		
	elseif Settings['state'] == "MENU" then
	
		if Screen['opacity'] < 254 then Screen['opacity'] = Settings['time'] * 8 end
		if Screen['opacity'] == 254 then Screen['opacity'] = 255 end

	elseif Settings['state'] == "PAUSE" then 

	elseif Settings['state'] == "PLAYING" then

	elseif Settings['state'] == "GAMEOVER" then
			
	elseif Settings['state'] == "INFO" then

	elseif Settings['state'] == "SETTINGS" then

	end
	
end

function love.draw()

	if Settings['state'] == "LOADING" then -- Loading
		
		love.graphics.setFont(Settings['font'])
		
		love.graphics.setColor(255, 255, 255, Screen['opacity']) -- red, green, blue, Screen['opacity'] (this would be white with 20% Screen['opacity'])
		love.graphics.draw(Images['wallpaper'] , Screen['w']/2 - (Images['wallpaper']:getWidth() / 2), Screen['h']/2 - (Images['wallpaper']:getHeight() / 2))
		
		love.graphics.setColor(255, 255, 255, 255) -- red, green, blue, Screen['opacity']
		if Settings['time']>18 then Settings['state'] = "MENU" end
		if Settings['time']<18 and Settings['time']>15 then love.graphics.draw(Images['odnsrvns_logo'] , Screen['w']/2 - (Images['odnsrvns_logo']:getWidth() / 2), Screen['h']/2 - (Images['odnsrvns_logo']:getHeight() / 2)) else end
		if Settings['time']<15 and Settings['time']>12 then love.graphics.draw(Images['lua_logo'] , Screen['w']/2 - (Images['lua_logo']:getWidth() / 2), Screen['h']/2 - (Images['lua_logo']:getHeight() / 2)) else end
		if Settings['time']<12 and Settings['time']>9 then love.graphics.draw(Images['openal_logo'] , Screen['w']/2 - (Images['openal_logo']:getWidth() / 2), Screen['h']/2 - (Images['openal_logo']:getHeight() / 2)) else end
		if Settings['time']<9 and Settings['time']>6 then love.graphics.draw(Images['opengl_logo'] , Screen['w']/2 - (Images['opengl_logo']:getWidth() / 2), Screen['h']/2 - (Images['opengl_logo']:getHeight() / 2)) else end
		if Settings['time']<6 and Settings['time']>3 then love.graphics.draw(Images['love_logo'] , Screen['w']/2 - (Images['love_logo']:getWidth() / 2), Screen['h']/2 - (Images['love_logo']:getHeight() / 2)) else end
	
		
	elseif Settings['state'] == "MENU" then
		
		-- Wallpaper & Logo
		love.graphics.setColor(255, 255, 255, Screen['opacity']) -- red, green, blue, Screen['opacity'] (this would be white with 20% Screen['opacity'])
		love.graphics.draw(Images['wallpaper'] , Screen['w']/2 - (Images['wallpaper']:getWidth() / 2), Screen['h']/2 - (Images['wallpaper']:getHeight() / 2))
		love.graphics.draw(Images['title'] , Screen['w']/2 - (Images['title']:getWidth() / 2), Screen['h']/2 - (Images['title']:getHeight() / 2))
		
		-- Music Title
		love.graphics.setFont(Settings['font'])
		love.graphics.setColor(225, 255, 255, 50)
		love.graphics.print("Music: Twilight - Stellardrone", Screen['w'] - 250, Screen['h'] - 25)
		
		--Play BUTTON			
		love.graphics.setFont(Button['font'])
		Button['rcolor'] = 255 Button['gcolor'] = 255 Button['bcolor'] = 255 Button['opacity'] = 150
		Button['x'] = Screen['w'] - Screen['w']/8 
		Button['y'] = Screen['h'] - Screen['h']/8
		Button['w'] = Button['font']:getWidth("Play") 
		Button['h'] = Button['font']:getHeight("Play")
		if Mouse['x'] > Button['x'] and Mouse['y'] > Button['y'] and Mouse['x'] < Button['x'] + Button['w'] and Mouse['y'] < Button['y'] + Button['h'] then 
			Button['opacity'] = 200 
			Button['rcolor'] = 200
			if Button['click'] == 1 then TEsound.play(Sounds['click'], {"click"}, Settings['volume']) Button['click'] = 0 end
			if Mouse['l'] == true and Settings['time'] >1 then Settings['state'] = "PLAYING" Settings['time'] = 0 end 
		end
		
		if Button['rcolor'] == 255 then Button['click'] = 1 end
		love.graphics.setColor(Button['rcolor'], Button['gcolor'], Button['bcolor'], Button['opacity']) -- red, green, blue, Screen['opacity']
		love.graphics.print("Play", Button['x'], Button['y'])
		

	elseif Settings['state'] == "PAUSE" then 

	elseif Settings['state'] == "PLAYING" then
	
		-- Wallpaper
		love.graphics.setColor(255, 255, 255, 150) -- red, green, blue, Screen['opacity'] (this would be white with 20% Screen['opacity'])
		love.graphics.draw(Images['wallpaper'] , Screen['w']/2 - (Images['wallpaper']:getWidth() / 2), Screen['h']/2 - (Images['wallpaper']:getHeight() / 2))
		love.graphics.draw(Images['title'] , Screen['w']/2 - (Images['title']:getWidth() / 2), Screen['h']/8 - (Images['title']:getHeight() / 2))
		
		-- Music Title
		love.graphics.setFont(Settings['font'])
		love.graphics.setColor(225, 255, 255, 50)
		love.graphics.print("Music: Twilight - Stellardrone", Screen['w'] - 250, Screen['h'] - 25)
		
		--Text Box	
		love.graphics.setFont(Settings['chat_font'])
		love.graphics.setColor(255, 255, 255, 150) -- red, green, blue, Screen['opacity'] (this would be white with 20% Screen['opacity'])
		love.graphics.rectangle("line", Screen['w']/8, Screen['h']/4, Screen['w']/1.7, Screen['h']/2 )
		
		if Player1['state'] == "INTRO" then 
			love.graphics.print(System['intromsg'], Screen['w']/8 + Settings['fontsize']/4, Screen['h']/4)
		elseif Player1['state'] == "PLAYING" then 
			love.graphics.print(System['textbox'], Screen['w']/8 + Settings['fontsize']/4, Screen['h']/4)
		end
		
		-- Input Box
		love.graphics.print(Player1['input'], Screen['w']/8 + Settings['fontsize']/4, Screen['h'] - Screen['h']/4 - (Settings['fontsize']*1.25))
		love.graphics.setColor(255, 255, 255, 15) -- red, green, blue, Screen['opacity'] (this would be white with 20% Screen['opacity'])
		love.graphics.rectangle("fill", Screen['w']/8, Screen['h'] - Screen['h']/4 - (Settings['fontsize']*1.25), Screen['w']/1.7, (Settings['fontsize']*1.25))
		
		-- Stats Box
		love.graphics.setFont(Settings['font'])
		love.graphics.setColor(150, 255, 255, 200)
		love.graphics.print("Name:    " .. Player1['name'], Screen['w'] - Screen['w']/4 + 10, Screen['h']/4 + 5)
		love.graphics.setColor(255, 255, 255, 150)
		love.graphics.rectangle("line", Screen['w'] - Screen['w']/4, Screen['h']/4, Screen['w'] - Screen['w']/1.15, Screen['h']/2 )
		love.graphics.print("Level:    " .. Player1['level'], Screen['w'] - Screen['w']/4 + 10, Screen['h']/4 + 25)
		love.graphics.print("XP:    " .. Player1['xp'], Screen['w'] - Screen['w']/4 + 10, Screen['h']/4 + 45)
		love.graphics.print("Health:    " .. Player1['health'], Screen['w'] - Screen['w']/4 + 10, Screen['h']/4 + 65)
		love.graphics.print("Armor:    " .. Player1['armor'], Screen['w'] - Screen['w']/4 + 10, Screen['h']/4 + 85)
		love.graphics.print("Gold:    " .. Player1['gold'], Screen['w'] - Screen['w']/4 + 10, Screen['h']/4 + 105)
		love.graphics.print("Inventory:    " .. Player1['inventory'], Screen['w'] - Screen['w']/4 + 10, Screen['h']/4 + 125)
		
		--Exit Button
		love.graphics.setFont(Button['font'])
		Button['rcolor'] = 255 Button['gcolor'] = 255 Button['bcolor'] = 255 Button['opacity'] = 150
		Button['x'] = Screen['w'] - Screen['w']/8 
		Button['y'] = Screen['h'] - Screen['h']/8
		Button['w'] = Button['font']:getWidth("Play") 
		Button['h'] = Button['font']:getHeight("Play")
		if Mouse['x'] > Button['x'] and Mouse['y'] > Button['y'] and Mouse['x'] < Button['x'] + Button['w'] and Mouse['y'] < Button['y'] + Button['h'] then 
			Button['opacity'] = 200 
			Button['rcolor'] = 200
			if Button['click'] == 1 then TEsound.play(Sounds['click'], {"click"}, Settings['volume']) Button['click'] = 0 end
			if Mouse['l'] == true and Settings['time'] >1 then Settings['state'] = "MENU" Settings['time'] = 0 end 
		end
		
		if Button['rcolor'] == 255 then Button['click'] = 1 end
		love.graphics.setColor(Button['rcolor'], Button['gcolor'], Button['bcolor'], Button['opacity']) -- red, green, blue, Screen['opacity']
		love.graphics.print("Exit", Button['x'], Button['y'])
		

	elseif Settings['state'] == "GAMEOVER" then
			
	elseif Settings['state'] == "INFO" then

	elseif Settings['state'] == "SETTINGS" then

	end

	if Settings['console'] == 1 then
	
	love.graphics.setFont(Settings['font'])
		if Settings['FPS'] == 1 then
			love.graphics.setColor(0, 255, 0, 100) -- red, green, blue, Screen['opacity']
			love.graphics.print("FPS: " .. tostring(love.timer.getFPS( )), Screen['w'] - 64, 5)
		end
		
	love.graphics.setColor(255, 255, 255, 100) -- red, green, blue, Screen['opacity']
	love.graphics.print("Opacity: " .. math.floor(Screen['opacity']), 5, 5)
	love.graphics.print("Time: " .. math.floor(Settings['time']), 5, 20)
	love.graphics.print("State: ".. (Settings['state']), 5, 35)
	love.graphics.print("Volume: ".. Settings['volume'], 5, 50)
	love.graphics.print("mX: " .. Mouse['x'], 5, 65)
	love.graphics.print("mY: " .. Mouse['y'], 5, 80)
	love.graphics.print("Lines: " .. System['textbox_strings'], 5, 95)
	
	
	
	end
	
end

function love.focus( bool )

end

function love.textinput( text )

end

function love.resize( w, h )

end

function love.textinput(t)
   if Settings['state'] == "PLAYING" then Player1['input'] = Player1['input'] .. t end
end


function love.keypressed( key, isrepeat )
   

	

end

function love.keyreleased( key )

	if key == 'escape' then love.event.quit() end
	if Settings['state'] == "PLAYING" and key == "backspace" then Player1['input'] = Player1['input']:sub(1, -2) end
	if Settings['state'] == "PLAYING" and Player1['state'] == "INTRO" and key == "return" then Player1['input'] = ""  System['textbox'] = "" Player1['state'] = "PLAYING" end 
	if Settings['state'] == "PLAYING" and Player1['state'] == "PLAYING" and key == "return" then System['textbox'] = System['textbox'] .. "\n" .. Player1['input'] Player1['input'] = "" end 

end

function love.mousepressed( x, y, button)
 
end

function love.mousereleased( x, y )

end

function love.quit()
 
end
