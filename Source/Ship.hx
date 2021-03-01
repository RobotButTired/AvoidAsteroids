package ;

import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.Sprite;

class Ship extends Sprite
{
    var bmpStraight:Bitmap;
    public var speed:Float;
    public function new(name:String)
    {
        super();

        speed = 0.0;
        bmpStraight = new Bitmap(Assets.getBitmapData("assets/img/"+name+".png"));

        bmpStraight.scaleX = 0.15;
        bmpStraight.scaleY = 0.15;
        bmpStraight.x = -bmpStraight.width/2;
        bmpStraight.y = -bmpStraight.height/2;
       
        this.addChild(bmpStraight);
    }

    public function checkBorders():Void
    {
        if(this.x-this.width/2.5 <= 0)
            {
                this.x = this.width/2.5+1;
                this.speed = 0.0;
            }
        if(this.x >= 800-this.width/2.5)
            {
                this.x = 800-this.width/2.5-1;
                this.speed = 0.0;
            }
        //trace(stage.width);
    }
}