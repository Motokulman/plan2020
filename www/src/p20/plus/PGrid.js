

export class PGrid  {
    constructor(cont,wh,rwh) {
    	this.type="PGrid";
    	
        var self = this;
        this.texture = PIXI.Texture.from('resources/image/fill.png');
        //this._scaleGrid = this.texture ? this.texture.baseTexture.width : 100;

        //var scale = 100 / 256;

        this.wh = wh;
        var sprit = new PIXI.extras.TilingSprite(this.texture, this.wh, this.wh);
        //sprit.anchor.set(0.5, 0.5);
        cont.addChild(sprit);
        var scx = (100 / 256)  /(rwh/100);
        sprit.tileScale.set(scx, scx);
        sprit.alpha=0.9;
        sprit.position.x=-this.wh/2;
        sprit.position.y=-this.wh/2;
    }
}  

