package;

import openfl.utils.Assets;
import openfl.display.Bitmap;
import openfl.display.Sprite;

class Asteroid extends Sprite
{
    var speed:Float;
    var rotationSpeed:Float;
    var bmpAsteroid_0:Bitmap;
    var bmpAsteroid_1:Bitmap;
    public function new(name:String)
    {
        super();

        bmpAsteroid_0 = new Bitmap(Assets.getBitmapData("assets/img/"+name+".png"));
       // trace(bmpAsteroid_0.width+" "+bmpAsteroid_0.height);
        bmpAsteroid_0.x = -bmpAsteroid_0.width/2;
        bmpAsteroid_0.y = -bmpAsteroid_0.height/2;
        this.addChild(bmpAsteroid_0);
        speed = Math.random()*8.0;
        rotationSpeed = Math.random()*10.0;
        if(0.5 <= Math.random())
            rotationSpeed -= 2*rotationSpeed;
        this.x = 50.0 + Math.random()*700.0;
        this.y =-50.0;
           
    }

    public function move(baseSpeed:Float)
    {
           this.y += baseSpeed + speed;
    }

    public function asteroidRotation():Void
        {
               this.rotation += rotationSpeed;
        }

}