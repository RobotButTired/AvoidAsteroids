package ;

import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.Sprite;

class Parallaxe extends Sprite
{
    var bmpSpace_1:Bitmap;
    var bmpSpace_2:Bitmap;
    
    public function new(name:String)
    {
        super();
        bmpSpace_1 = new Bitmap(Assets.getBitmapData("assets/img/"+name+".png"));
        this.addChild(bmpSpace_1);
        bmpSpace_2 = new Bitmap(Assets.getBitmapData("assets/img/"+name+".png"));
        bmpSpace_2.y = -bmpSpace_1.height; 
        this.addChild(bmpSpace_2);
       // trace(bmpSpace_1.height);
    }

    public function move(shift:Float)
    {
        bmpSpace_1.y += shift;
        bmpSpace_2.y += shift;   
        if(bmpSpace_1.y>=bmpSpace_1.height)
            bmpSpace_1.y -= bmpSpace_1.height*2;
        if(bmpSpace_2.y>=bmpSpace_2.height)
            bmpSpace_2.y -=  bmpSpace_2.height*2;
    }
}
