package corez
{
	import flash.media.Sound;
	import flash.media.SoundTransform;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	
	//ASSET LOADER CLASS (images, textures, etc)
	public class Assets
	{
		
		//GOLD CELLS
		[ Embed(source= "Assets/Cells/CELL_00.png") ]
		private static var cell0:Class;
		public static var cell0Texture:Texture;

		//single static texture -> Optimized
		[ Embed(source= "Assets/space.png") ]
		private static var background:Class;
		public static var backgroundTexture:Texture;
			
		//backtexture
		[ Embed(source= "Assets/backTexture.jpg") ]
		private static var backNode:Class;
		public static var backNodeTexture:Texture;
		
		//particles
		[ Embed(source= "Assets/Particles/texture.png") ]
		private static var particle:Class;
		public static var particleTexture:Texture;
		
		///particle XML or PEX
		[ Embed(source= "Assets/Particles/particle.pex", mimeType = "application/octet-stream")]
		public static var spacedustXML:Class;
			
		//sound effects
		[Embed (source="Assets/Sounds/FullHudStartup.mp3")]
		private static var hudStartSound:Class;
		public static var hudStart:Sound;
		
		[Embed (source="Assets/Sounds/solarFinal.mp3")]
		private static var solarSound:Class;
		public static var solar:Sound;
		
		[Embed (source="Assets/Sounds/solarOpen.mp3")]
		private static var solarOpenSound:Class;
		public static var solarOpen:Sound;
		
		[Embed (source="Assets/Sounds/ammNodeModule.mp3")]
		private static var ammoSound:Class;
		public static var ammo:Sound;
		
		[Embed (source="Assets/Sounds/ammButtonSelect.mp3")]
		private static var ammoButtonSound:Class;
		public static var ammoButton:Sound;
		
		[Embed (source="Assets/Sounds/solarButtonSelect.mp3")]
		private static var button1Sound:Class;
		public static var button1:Sound;
		
		[Embed (source="Assets/Sounds/buttonSelect1.mp3")]
		private static var button2Sound:Class;
		public static var button2:Sound;
			
		[Embed (source="Assets/Sounds/winterModeActivate.mp3")]
		private static var winterSound:Class;
		public static var winter:Sound;
		
		[Embed (source="Assets/Sounds/winterDataSounds.mp3")]
		private static var winterDataSound:Class;
		public static var winterData:Sound;
		
		[Embed (source="Assets/Sounds/emblemdata.mp3")]
		private static var emblemDataSound:Class;
		public static var emblemData:Sound;
		
		[Embed (source="Assets/Sounds/emblemnoise.mp3")]
		private static var emblemNoiseSound:Class;
		public static var emblemNoise:Sound;
		
		[Embed (source="Assets/Sounds/emblemAura.mp3")]
		private static var emblemAuraSound:Class;
		public static var emblemAura:Sound;
		
		[Embed (source="Assets/Sounds/RETheme.mp3")]
		private static var evilSound:Class;
		public static var evilAura:Sound;
		
		[Embed (source="Assets/Sounds/missionSound.mp3")]
		private static var missionSound:Class;
		public static var missionAura:Sound;
		
		[Embed (source="Assets/Sounds/typingSound.mp3")]
		private static var typingSound:Class;
		public static var typingAura:Sound;
		
		[Embed (source="Assets/Sounds/logicSound.mp3")]
		private static var logicSound:Class;
		public static var logicAura:Sound;
		
		[Embed (source="Assets/Sounds/SlipLaunch.mp3")]
		private static var launchSound:Class;
		public static var launch:Sound;
		
		[Embed (source="Assets/Sounds/launchBeeps.mp3")]
		private static var launchBSound:Class;
		public static var launchB:Sound;
		
		[Embed (source="Assets/Sounds/buttonSlide.mp3")]
		private static var buttonSlideSound:Class;
		public static var buttonSlide:Sound;
		
		[Embed (source="Assets/Sounds/psionicWaveform.mp3")]
		private static var psionicSound:Class;
		public static var psionic:Sound;
		
		[Embed (source="Assets/Sounds/bracketSlide.mp3")]
		private static var bracketSound:Class;
		public static var bracket:Sound;
		
		[Embed (source="Assets/Sounds/helperSound.mp3")]
		private static var helperSound:Class;
		public static var helper:Sound;
		//END sound effects
				
		//mask
		[ Embed(source= "Assets/Mask/mask.png") ]
		private static var mask:Class;
		public static var maskTexture:Texture;
			
		//winter oxy modules - BLUE
		[ Embed(source= "Assets/Mask/OxyWinterBlue.png") ]
		private static var oxyBlue:Class;
		public static var oxyBlueTexture:Texture;
		
		//winter white
		[ Embed(source= "Assets/Mask/OxyWinterWhite.png") ]
		private static var oxyWhite:Class;
		public static var oxyWhiteTexture:Texture;
		
		//skull shell top
		[ Embed(source= "Assets/Solar/topShellSkullSteel.png") ]
		private static var shellTop:Class;
		public static var shellTopTexture:Texture;
		
		//skull shell bottom
		[ Embed(source= "Assets/Solar/bottomShellSkullSteel.png") ]
		private static var shellBottom:Class;
		public static var shellBottomTexture:Texture;

		//ATLAS BUTTON SPRITE SHEET 1 texture atlas (Includes SolarButton, LoadingModule, EyeScanModule
		[Embed (source="Assets/Buttons/ButtonSheet1.png")]
		private static var button1Atlas:Class;
		
		public static var button1textureAtlas:TextureAtlas;
		
		[Embed(source="assets/Buttons/ButtonSheet1.xml", mimeType = "application/octet-stream")]
		private static var button1XML:Class;
		
		///ATLAS FULL SUIT SPRITE (includes, infomoduleTop, informoduleBottom, suit(includes top and bottom)
		[Embed (source="Assets/Suit/FullSuitSheetPlus.png")]
		private static var suitPlusAtlas:Class;
		
		public static var suittextureplusAtlas:TextureAtlas;
		
		[Embed(source="assets/Suit/FullSuitSheetPlus.xml", mimeType = "application/octet-stream")]
		private static var suitPlusXML:Class;
		
		//LOG NUMBERS ATLAS -> holds precise data numbers for movieclips
		[Embed (source="Assets/Suit/logNumbers.png")]
		private static var logAtlas:Class;
		
		public static var textureLOGAtlas:TextureAtlas;
		
		[Embed(source="assets/Suit/logNumbers.xml", mimeType = "application/octet-stream")]
		private static var logXML:Class;
		
		//WINTER ATLAS 
		[Embed (source="Assets/Mask/winter.png")]
		private static var winterAtlas:Class;
		
		public static var winterTextureAtlas:TextureAtlas;
		
		[Embed(source="assets/Mask/winter.xml", mimeType = "application/octet-stream")]
		private static var winterXML:Class;
		
		//NODES
		[Embed (source="Assets/Nodes/nodes.png")]
		private static var nodeAtlas:Class;
		
		public static var nodeTextureAtlas:TextureAtlas;
		
		[Embed(source="assets/Nodes/nodes.xml", mimeType = "application/octet-stream")]
		private static var nodeXML:Class;
		
		//HYBRID
		[Embed (source="Assets/Nodes/hybrid1.png")]
		private static var hybrid1Atlas:Class;
		
		public static var hybrid1TextureAtlas:TextureAtlas;
		
		[Embed(source="assets/Nodes/hybrid1.xml", mimeType = "application/octet-stream")]
		private static var hybrid1XML:Class;
		
		//HYBRID 2
		[Embed (source="Assets/Nodes/hybrid2.png")]
		private static var hybrid2Atlas:Class;
		
		public static var hybrid2TextureAtlas:TextureAtlas;
		
		[Embed(source="assets/Nodes/hybrid2.xml", mimeType = "application/octet-stream")]
		private static var hybrid2XML:Class;
		
		//constructor function acting as putting one image in memory at one time
		public static function init():void
		{
			//cells
			cell0Texture = Texture.fromBitmap(new cell0());
			
			//background texture
			backgroundTexture = Texture.fromBitmap(new background());
				
			//skull texture
			backNodeTexture = Texture.fromBitmap(new backNode());

			///////SOLAR SHEILD ->
			//skull shell top
			shellTopTexture = Texture.fromBitmap(new shellTop());
			
			//skull shell bottom
			shellBottomTexture = Texture.fromBitmap(new shellBottom());
			
			//haunting sound
			solar = new solarSound;
			solar.play(0,0,new SoundTransform(0));
			
			//pshh sound
			solarOpen = new solarOpenSound;
			solarOpen.play(0,0,new SoundTransform(0));
			//////END SOLAR SHIELD ->
			
			//AMMUNITION NODE ->
			ammo = new ammoSound;
			ammo.play(0,0,new SoundTransform(0));
			
			ammoButton = new ammoButtonSound;
			ammoButton.play(0,0,new SoundTransform(0));
			//END AMMUNITION NODE ->
			
			///////MAIN SUIT ->		
			//hud startup sound
			hudStart = new hudStartSound;
			hudStart.play(0,0,new SoundTransform(0));
			////MAIN SUIT END ->
			
			///WINTER MASK ->
			//mask
			maskTexture = Texture.fromBitmap(new mask());
			
			winter = new winterSound;
			winter.play(0,0,new SoundTransform(0));
			
			winterData = new winterDataSound;
			winterData.play(0,0,new SoundTransform(0));
			
			emblemData = new emblemDataSound;
			emblemData.play(0,0,new SoundTransform(0));
			
			emblemNoise = new emblemNoiseSound;
			emblemNoise.play(0,0,new SoundTransform(0));
			
			emblemAura = new emblemAuraSound;
			emblemAura.play(0,0,new SoundTransform(0));
			
			//particel texture
			particleTexture = Texture.fromBitmap(new particle());
			
			//winter white oxy
			oxyWhiteTexture = Texture.fromBitmap(new oxyWhite());
			
			//winter blue oxy
			oxyBlueTexture = Texture.fromBitmap(new oxyBlue());
			///END WINTER MASK ->
			
			
			///TEXTURE ATLASES -------------------->
			
			//NODE ATLAS
			nodeTextureAtlas = new TextureAtlas(Texture.fromBitmap(new nodeAtlas()), XML(new nodeXML()));
			
			//hybrid1
			hybrid1TextureAtlas = new TextureAtlas(Texture.fromBitmap(new hybrid1Atlas()), XML(new hybrid1XML()));
			
			//hybrid2
			hybrid2TextureAtlas = new TextureAtlas(Texture.fromBitmap(new hybrid2Atlas()), XML(new hybrid2XML()));
			
			//BUTTON ATLAS
			button1textureAtlas = new TextureAtlas(Texture.fromBitmap(new button1Atlas()), XML(new button1XML()));
					
			//SUIT ATLAS PLUS
			suittextureplusAtlas = new TextureAtlas(Texture.fromBitmap(new suitPlusAtlas()), XML(new suitPlusXML()));
			
			//LOG NUMBERS
			textureLOGAtlas = new TextureAtlas(Texture.fromBitmap(new logAtlas()), XML(new logXML()));
			
			//WINTER
			winterTextureAtlas = new TextureAtlas(Texture.fromBitmap(new winterAtlas()), XML(new winterXML()));	
			///END TEXTURE ATLAS ---------------------->
			
			//sounds
			//play with 0 sound (bug in flash plays sound when importing = solution would be to play with 0 sound)
				
			//bracket
			bracket = new bracketSound;
			bracket.play(0,0,new SoundTransform(0));
			
			//psionic
			psionic = new psionicSound;
			psionic.play(0,0,new SoundTransform(0));
				
			//starcraft button sound
			button2 = new button2Sound;
			button2.play(0,0,new SoundTransform(0));
				
			//re theme
			evilAura = new evilSound;
			evilAura.play(0,0,new SoundTransform(0));
			
			//mission sound
			missionAura = new missionSound;
			missionAura.play(0,0,new SoundTransform(0));
			
			//typing sound
			typingAura = new typingSound;
			typingAura.play(0,0,new SoundTransform(0));
			
			//logic sound
			logicAura = new logicSound;
			logicAura.play(0,0,new SoundTransform(0));
			
			//logic sound
			launch = new launchSound;
			launch.play(0,0,new SoundTransform(0));
			
			//logic beeps sound
			launchB = new launchBSound;
			launchB.play(0,0,new SoundTransform(0));
			
			//button slide
			buttonSlide = new buttonSlideSound;
			buttonSlide.play(0,0,new SoundTransform(0));
			
			//helper
			helper = new helperSound;
			helper.play(0,0,new SoundTransform(0));
			
		}
	}
}