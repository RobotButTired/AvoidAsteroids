package;


import haxe.Timer;
import openfl.text.TextField;
import openfl.geom.Point;
import openfl.events.KeyboardEvent;
import openfl.Lib;
import openfl.events.Event;
import openfl.display.Sprite;



class Game extends Sprite
{
	var space:Parallaxe;
	var stars:Parallaxe;
	var nearStars:Parallaxe;
	var ship:Ship;
	var asteroids:Array<Asteroid>;
	var textField:TextField;
	var scoreField:TextField;
	public var score:Int;
	var timeFlag:Float;
	
	public function new()
	{
		super();
		space = new Parallaxe("Space");
		
		addChild(space);
		//trace(stage.height);
		stars = new Parallaxe("Stars");
		stars.scaleX = 2;
		stars.scaleY = 2;
		addChild(stars);
		addEventListener(Event.ENTER_FRAME,onFrame);

		nearStars = new Parallaxe("NearStars");
		nearStars.scaleX =2.5;
		nearStars.scaleY =2.5;
		addChild(nearStars);

		ship = new Ship("Ship");
		
		ship.x = space.width/2;
		ship.y = space.height/2 - ship.height/2;
		addChild(ship);
		

		asteroids = [];

		Lib.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, onDown);
        Lib.current.stage.addEventListener(KeyboardEvent.KEY_UP, onUp);

		
		scoreField = new TextField();
		score =0;
		scoreField.textColor = 0xFFFFFF;
		scoreField.text = "Score: "+Std.string(score);
		scoreField.scaleX = 1.5;
		scoreField.scaleY = 1.5;
		addChild(scoreField);

		timeFlag = Timer.stamp();

		var gameIsOverText = "Game is over!";
			textField = new TextField();
			textField.textColor = 0xFFFFFF;
			textField.text = gameIsOverText;
			textField.scaleX = 2.5;
			textField.scaleY = 2.5;
			textField.x = 400 - textField.width/2.5;
			textField.y = 300;
			


	}
	var metAmount:TextField;
	

	var probability = 0.1;
	var difficultlyLevel = 1;
	var asteroidsAmount = 5;
	public function onFrame(e:Event):Void
	{
		if(Timer.stamp() - timeFlag >= 1.0/60.0)
			{
				if(!gameIsOver)
					{
						if(score >= difficultlyLevel*50 && difficultlyLevel < 5)
							{
								asteroidsAmount += 2;
								difficultlyLevel += 1; 
							}

						space.move(3);	
						stars.move(4.5);
						nearStars.move(6);
						for(a in asteroids)
							{
								a.move(5.0);
								a.asteroidRotation();
							}
					
						ship.x+= ship.speed;
						ship.checkBorders();

						if(isLeft && ship.speed> -15.0)
								ship.speed -= 0.9;
						if(isRight && ship.speed< 15.0)
								ship.speed += 0.9;


						if(!isLeft && !isRight)
						ship.speed *= 0.97;

						if(asteroids.length <= asteroidsAmount && probability >= Math.random())
							{
								if(0.33 < Math.random())
									asteroids.push(new Asteroid("Asteroid0"));
								else if(0.5 < Math.random())
									asteroids.push(new Asteroid("Asteroid1"));
								else 
									asteroids.push(new Asteroid("Asteroid3"));
								this.addChild(asteroids[asteroids.length-1]);
								//metAmount.text = Std.string(asteroids.length);
							}
						if(asteroids.length > 0)
							{
								for(a in asteroids)
									if(a.y >= 650)
										{
										asteroids.remove(a);
										this.removeChild(a);
										score += 1;
										scoreField.text ="Score: "+ Std.string(score);	
										}
							}	
						collision();			
					}
				else
				{
					if(!this.contains(textField))
						this.addChild(textField);
				}
                timeFlag = Timer.stamp();
			}	

	}
	
	var isLeft = false;
	var isRight = false;
	public function onDown(e:KeyboardEvent):Void
	{
		
		if(e.keyCode == 37) 
			{
				isLeft = true;
			}
		if(e.keyCode == 39)
			{
				 isRight = true;
			}
	}
	public function onUp(e:KeyboardEvent) :Void
	{

		if(e.keyCode == 37) isLeft = false;
		if(e.keyCode == 39) isRight = false;
	}

	public var gameIsOver = false;
	public function collision()
	{
		for(a in asteroids)
		if(Point.distance(new Point(ship.x,ship.y), new Point(a.x,a.y)) <= 50.0)
			gameIsOver = true;
	}
}
