package ;

import lime.math.Vector2;
import openfl.events.Event;
import openfl.display.BitmapData;
import openfl.display.Bitmap;
import haxe.ui.containers.VBox;
import haxe.ui.events.MouseEvent;
import openfl.utils.Assets;
import openfl.Lib;
import openfl.net.URLRequest;

@:xml('
<vbox style="padding: 5px; width: 100%; height: 100%;">
    <style>
        .button {
            font-size: 20px;
        }
    </style>
    <hbox style="width: 250px; height: 100%;" horizontalAlign="center">
        <vbox style="width: 100%; height: 50%;" verticalAlign="center">
            <frame text="aschaafsma.nl" height="100%" width="100%">
                <vbox width="100%">
                    <section-header text="Onder Constructie"/>
                    <hbox width="100%" style="padding-left:5px;padding-right:5px;spacing:50px;">
                        <label width="100%" text="aschaafsma.nl is onder constructie!" />
                    </hbox>
                    <hbox width="100%" style="padding-left:5px;padding-right:5px;spacing:50px;">
                        <label width="100%" text="Ik ben momenteel bezig met een redesign van mijn portfolio website. Mijn oude is inhoudelijk out of date sinds 2019, en de nieuwe is qua ontwerp min of meer klaar maar heeft nog veel backend werk nodig." />
                    </hbox>
                    <link id="link_oud" text="Oud" style="padding-left:5px;padding-right:5px;spacing:50px;" />
                    <link id="link_nieuw" text="Nieuw" style="padding-left:5px;padding-right:5px;spacing:50px;" />
                    <link id="link_gh" text="Mijn Github" style="padding-left:5px;padding-right:5px;spacing:50px;" />
                    <link id="link_gt" text="Mijn Gitea" style="padding-left:5px;padding-right:5px;spacing:50px;" />

                </vbox>
            </frame>
        </vbox>    
    </hbox>    
</vbox>
')
class MainView extends VBox {
    var bitmap:Bitmap = new Bitmap();
    public function new() {
        super();
        this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
        var bmpd:BitmapData = Assets.getBitmapData("UnderConstruction");
        bitmap = new Bitmap(bmpd);
        this.addChild(bitmap);
        // button1.onClick = function(e) {
        //     button1.text = "Thankse!";
        // }
    }
    var baseRes:Vector2 = new Vector2(1280,720);
    var vec:Vector2 = new Vector2(1,1);
    public function onEnterFrame(e:Event){
        bitmap.x +=vec.x;
        bitmap.y +=vec.y;

        if (bitmap.y + bitmap.height > stage.stageHeight){
            vec.y = -1;
            bitmap.y = stage.stageHeight - bitmap.height;
        }
        if (bitmap.y < 0){
            vec.y = 1;
            bitmap.y = 0;
        }
        if (bitmap.x + bitmap.width > stage.stageWidth){
            vec.x = -1;
            bitmap.x = stage.stageWidth - bitmap.width;
        }
        if (bitmap.x < 0){
            vec.x = 1;
            bitmap.x = 0;
        }
        var xundersize:Float = stage.stageWidth / baseRes.x;
        var yundersize:Float = stage.stageHeight / baseRes.x;
        var scalar:Float = 1;
        if(xundersize > yundersize){
            scalar = yundersize;

        }
        else{
            scalar = xundersize;
        }
        bitmap.scaleX = bitmap.scaleY = scalar *0.25;

    }
    
    @:bind(link_oud, MouseEvent.CLICK)
    private function onMyButton(e:MouseEvent) {
        Lib.getURL (new URLRequest ("https://oud.aschaafsma.nl"), "_blank"); 
    }
    @:bind(link_nieuw, MouseEvent.CLICK)
    private function onMyButton2(e:MouseEvent) {
        Lib.getURL (new URLRequest ("https://nieuw.aschaafsma.nl"), "_blank"); 
    }
    @:bind(link_gh, MouseEvent.CLICK)
    private function onMyButton3(e:MouseEvent) {
        Lib.getURL (new URLRequest ("https://github.com/Hion-V"), "_blank"); 
    }
    @:bind(link_gt, MouseEvent.CLICK)
    private function onMyButton4(e:MouseEvent) {
        Lib.getURL (new URLRequest ("https://git.subsonics.nl/andreas"), "_blank"); 
    }
}