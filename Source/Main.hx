package;



import openfl.geom.Rectangle;
import haxe.Timer;
import openfl.text.TextField;
import openfl.geom.Point;
import openfl.events.KeyboardEvent;
import openfl.Lib;
import openfl.events.Event;
import openfl.display.Sprite;



class Main extends Sprite
{

	var game:Game;
	var delay:Float;
	var previousScore:Int;
	var bestScore:Int;
	var bestScoreText:TextField;
	var prevScoreText:TextField;
	var timeFlag:Float;
	var sizeWidth = 800;
	var sizeHeigth = 600;

	public function new() 
	{
		super();
		game = new Game();	
		addChild(game);
		addEventListener(Event.ENTER_FRAME, onFrame);
		bestScore = 0;
		previousScore = 0;
		prevScoreText = new TextField();
		prevScoreText.textColor = 0xFFFFFF;
		prevScoreText.text = "Previous\nscore: "+Std.string(previousScore);
		prevScoreText.scaleX = 1.5;
		prevScoreText.scaleY = 1.5;
		prevScoreText.x = 720;
		addChild(prevScoreText);

		bestScoreText = new TextField();
		bestScoreText.textColor = 0xFFFFFF;
		bestScoreText.text = "Best\nscore: "+Std.string(previousScore);
		bestScoreText.scaleX = 1.5;
		bestScoreText.scaleY = 1.5;
		bestScoreText.x = 720;
		bestScoreText.y = 50;
		addChild(bestScoreText);

		var rect = new Rectangle(0,0,sizeWidth, sizeHeigth);
		this.scrollRect = rect;
	}

	public function onFrame(e:Event) 
	{
		
		if(!game.gameIsOver)
			startDelay();
		if(game.gameIsOver && Timer.stamp()-delay >= 2.0)
			{
				previousScore = game.score;
				if(bestScore < game.score)
					{
						bestScore = game.score;
						bestScoreText.text = "Best\nscore: "+Std.string(previousScore);
					}
				game = new Game();
				addChild(game);
				prevScoreText.text = "Previous\nscore: "+Std.string(previousScore);
				addChild(bestScoreText);
				addChild(prevScoreText);
			}
	}

	public function startDelay()
	{
		delay = Timer.stamp();	
	}


}