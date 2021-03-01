package;


import haxe.io.Bytes;
import lime.utils.AssetBundle;
import lime.utils.AssetLibrary;
import lime.utils.AssetManifest;
import lime.utils.Assets;

#if sys
import sys.FileSystem;
#end

@:access(lime.utils.Assets)


@:keep @:dox(hide) class ManifestResources {


	public static var preloadLibraries:Array<AssetLibrary>;
	public static var preloadLibraryNames:Array<String>;
	public static var rootPath:String;


	public static function init (config:Dynamic):Void {

		preloadLibraries = new Array ();
		preloadLibraryNames = new Array ();

		rootPath = null;

		if (config != null && Reflect.hasField (config, "rootPath")) {

			rootPath = Reflect.field (config, "rootPath");

		}

		if (rootPath == null) {

			#if (ios || tvos || emscripten)
			rootPath = "assets/";
			#elseif android
			rootPath = "";
			#elseif console
			rootPath = lime.system.System.applicationDirectory;
			#else
			rootPath = "./";
			#end

		}

		#if (openfl && !flash && !display)
		
		#end

		var data, manifest, library, bundle;

		#if kha

		null
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("null", library);

		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("null");

		#else

		data = '{"name":null,"assets":"aoy4:pathy28:assets%2Fimg%2FAsteroid0.pngy4:sizei1229y4:typey5:IMAGEy2:idR1y7:preloadtgoR0y28:assets%2Fimg%2FAsteroid1.pngR2i1015R3R4R5R7R6tgoR0y28:assets%2Fimg%2FAsteroid2.pngR2i10224R3R4R5R8R6tgoR0y28:assets%2Fimg%2FAsteroid3.pngR2i9361R3R4R5R9R6tgoR0y28:assets%2Fimg%2FNearStars.pngR2i2015R3R4R5R10R6tgoR0y37:assets%2Fimg%2Fopenfl_flappy_bird.zipR2i23961R3y6:BINARYR5R11R6tgoR0y23:assets%2Fimg%2FShip.pngR2i4364R3R4R5R13R6tgoR0y24:assets%2Fimg%2FSpace.pngR2i10372R3R4R5R14R6tgoR0y24:assets%2Fimg%2FStars.pngR2i19528R3R4R5R15R6tgh","rootPath":null,"version":2,"libraryArgs":[],"libraryType":null}';
		manifest = AssetManifest.parse (data, rootPath);
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("default", library);
		

		library = Assets.getLibrary ("default");
		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("default");
		

		#end

	}


}


#if kha

null

#else

#if !display
#if flash

@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_img_asteroid0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_img_asteroid1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_img_asteroid2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_img_asteroid3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_img_nearstars_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_img_openfl_flappy_bird_zip extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_img_ship_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_img_space_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_img_stars_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_default_json extends null { }


#elseif (desktop || cpp)

@:keep @:image("Assets/img/Asteroid0.png") @:noCompletion #if display private #end class __ASSET__assets_img_asteroid0_png extends lime.graphics.Image {}
@:keep @:image("Assets/img/Asteroid1.png") @:noCompletion #if display private #end class __ASSET__assets_img_asteroid1_png extends lime.graphics.Image {}
@:keep @:image("Assets/img/Asteroid2.png") @:noCompletion #if display private #end class __ASSET__assets_img_asteroid2_png extends lime.graphics.Image {}
@:keep @:image("Assets/img/Asteroid3.png") @:noCompletion #if display private #end class __ASSET__assets_img_asteroid3_png extends lime.graphics.Image {}
@:keep @:image("Assets/img/NearStars.png") @:noCompletion #if display private #end class __ASSET__assets_img_nearstars_png extends lime.graphics.Image {}
@:keep @:file("Assets/img/openfl_flappy_bird.zip") @:noCompletion #if display private #end class __ASSET__assets_img_openfl_flappy_bird_zip extends haxe.io.Bytes {}
@:keep @:image("Assets/img/Ship.png") @:noCompletion #if display private #end class __ASSET__assets_img_ship_png extends lime.graphics.Image {}
@:keep @:image("Assets/img/Space.png") @:noCompletion #if display private #end class __ASSET__assets_img_space_png extends lime.graphics.Image {}
@:keep @:image("Assets/img/Stars.png") @:noCompletion #if display private #end class __ASSET__assets_img_stars_png extends lime.graphics.Image {}
@:keep @:file("") @:noCompletion #if display private #end class __ASSET__manifest_default_json extends haxe.io.Bytes {}



#else



#end

#if (openfl && !flash)

#if html5

#else

#end

#end
#end

#end
