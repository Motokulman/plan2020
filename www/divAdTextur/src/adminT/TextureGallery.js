export  class TextureGallery extends DCont {
    constructor(_dCont,_x,_y,fun) {
    	super(); 
        let self = this;
        this.type = "TextureGallery";
 
        this.margin = 2;
        this.w1 = _dCont

        this.fun=fun;


        this._width=200
        this._textureType="All";

        if(_dCont)_dCont.add(this)
      
        this.x = _x||0
        this.y = _y||0

        this.panel = new DPanel(this, 0, 0);
        this.panel.width=this._width

        this.comboSort = new DComboBox(this.panel, this.margin, this.margin, null, function(){
        	self.textureType=self.comboSort.array[self.comboSort.index]
        	if(self.fun)self.fun("chench",self._textureType)
        })      
        this.comboSort.width = this._width - (this.margin*3)

        this.gallery = new GalleryN(this.panel, this.margin, (this.margin*2) + this.comboSort.height , () => {
        	if(self.fun)this.fun("downObj",self.gallery.array[self.gallery.index].object)
        });

        this.gallery.width = this._width - (this.margin*3);
        this.gallery.kolII = 4;
        this.gallery.widthPic =  (this._width - (this.margin*this.gallery.kolII+1) - 7) / this.gallery.kolII;
        this.gallery.heightPic = this.gallery.widthPic;
        this.gallery.visible = true;

        this.cSort=function() {        
        	let arrCont = []
        	if (self._textureType != 'All') {
        	for (var i = 0; i < this.objArr.length; i++) {
        			if (this.objArr[i].texture_type == self._textureType) arrCont.push(this.objArr[i])
        		}
        	} else { arrCont=this.objArr}
			this.gallery.start(arrCont);
        }


        this.objArr
		this.start=function(_objArr) {
			this.objArr=_objArr     	
        	for (var i = 0; i < 20; i++) {
        		_objArr.push(_objArr[1])
        	}
	
        	let arrIn = []
        	for (var i = 0; i < _objArr.length; i++) {
        		arrIn.push( _objArr[i].texture_type)
        	}
        	this.comboSort.array = [...new Set(arrIn), 'All']
        	this.comboSort.index=this.comboSort.array.length-1
        	this.cSort();
		}

		this.openId=function(_id) {
            self.gallery.index=_id-1
		}


	}


	set textureType (value) {
        if (this._textureType != value) {
            this._textureType = value;
            this.cSort()
        }           
    }
    get textureType () { return this._textureType; }
}



function GalleryN(dCont, _x, _y, _fun) {
    DGallery.call(this, dCont, _x, _y, _fun);
               
    this.type="GalleryN";
    this.linkO='https://alphakp.ru'
   

    this.createZamen=function(){            
        var r=new BoxXZ(this.content, 0, 0, this.downBtn, this);            
        return r;
    }

    this.dragColorGal=function(){
        for (var i = 0; i < this.array.length; i++) {
            this.array[i].dragColorGal()
        }
    }
}

GalleryN.prototype = Object.create(DGallery.prototype);
GalleryN.prototype.constructor = GalleryN;

Object.defineProperties(GalleryN.prototype, {

    index: {// Активный элемент
        set: function (value) {
            
            if (this.array[value] != undefined) {
                this.korektPoIndex(value);
            }
            
            this._index = value;
           

            for (var i = 0; i < this.array.length; i++) {
                if (this._index == i) this.array[i].activ = true;
                else this.array[i].activ = false;
            }

        },
        get: function () {
            return this._index;
        }
    },
})


function BoxXZ(dCont, _x, _y, _fun, par) {
    DBox.call(this, dCont, _x, _y, _fun);
    this.type = 'BoxXZ';
    var self=this
    this.par = par;


    this.dragColorGal=function(){
        if(this.object.c!=undefined){                    
            
            if(this._color1 != this.object.c){
                this._color1 = this.object.c;
                this.panel.color1=this._color1;
                this.draw()
            }
        }else{
         
            if(this._color1 != this.par._color1){
                this._color1 = this.par._color1;
                this.panel.color1=this._color1;
                this.draw();
            }
        }
    }


    this.startLoad = function (_obj) {
        this.object = _obj;
        // var link=aGlaf.resursData+""+_obj.id+"/64.png"+aGlaf.plusLink
        var link= self.par.linkO + _obj.src

        this.dragColorGal()

        if(_obj.id!=undefined){
            this.label.visible=true
            this.label.text=_obj.id
            this.label.div.style.pointerEvents="none";
            this.label.fontSize=10;
        }
        
        this.image.visible = true;
        if (this.image.link == link) {
            if (self.funLoad) self.funLoad();
        } else {
            this.image.width = 100;
            this.image.height = 100;
            this.image.link = link;

        }
       
        this.draw();
    };
    var ss
    this.draw = function () {
        ss = (this._width - this._otstup * 2) / this.image.picWidth;
        if (ss > (this._height - this._otstup * 2) / this.image.picHeight)ss = (this._height - this._otstup * 2) / this.image.picHeight;
        this.image.x = 0;
        this.image.width=this.image.picWidth*ss;
        this.image.height=this.image.picHeight*ss;

        this.image.x = (this._width - this.image.picWidth * ss) / 2;
        this.image.y = (this._height - this.image.picHeight * ss) / 2;

        this.label.x = 2//(this._width - this.label.curW) / 2;
        this.label.y = this._height - 11;

        if (this.postDraw) this.postDraw();
    };

}
BoxXZ.prototype = Object.create(DBox.prototype);
BoxXZ.prototype.constructor = BoxXZ;
