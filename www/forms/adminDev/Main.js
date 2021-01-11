
/*
главный класиик, стартует основное, грузит конфиг

дев 
vorodis2.com   
vorodis2@gmail.com 
2019
*/
/**/

import { MenuVerh } from './MenuVerh.js';
import { MenuLeft } from './MenuLeft.js';
import { MenuCent } from './MenuCent.js';

	/*
import { TView } from '../tourz/tView/TView.js';

import { MenuGal } from './MenuGal.js';
import { MenuPlane } from './MenuPlane.js';
import {MenuVorkug } from './MenuVorkug.js';
import { MenuDebug } from './MenuDebug.js';
import { KorectColor } from './KorectColor.js';

import {MenuVideo } from './MenuVideo.js';

import { MenuHelp} from './MenuHelp.js';
import { MenuError} from './MenuError.js';


import { LocalStorage } from '../localStorage/LocalStorageE6.js';*/
export class Main  {
  	constructor(div,fun) {  		
  		this.type="Main";
  		this.fun=fun
  		var self=this;
  		window.dcmParam = new DCM();


  	
  		this._bool=true
  		this._bool1=false
  		this._bool2=false
  		//this._anisotropy=1


		this.param={}

		this.param.wh=32;
		this.param.otstup=5;
		this.param.mobile=false
		this.param.whb=32;
        this.param.wb=150;
        this.param.otMy=26;
        this.param.sizeBase=180;
        this.param.color="#c60f30";
        this.param.colorFont="#ffffff";
        this.param.color1="#999999";
        this.param.sizeBase2=250;
        this.param.bRadius=24;

        this.param.maxW=350;
        this.param.maxH=350;
		this.param.debug=false;

		this.param.logo="null";
		this.param.link="null";

		this.param.server="http://192.168.1.116:8000/api/v1/";

	/**/

		var array=[];
        var vsakoUr=undefined
        var tView=undefined		
       	this.korectColor=undefined		
		this.dCont=new DCont(div);

		this.init=function(){ 


			this.param.mobile=dcmParam.mobile

			array[array.length]=this.menuVerh=new MenuVerh(this,function(s,p){	})

			array[array.length]=this.menuLeft=new MenuLeft(this,function(s,p,p1){
				if(s=="sobThree"){
					trace(p)
					self.menuCent.setSob(p)
				}
			})
			array[array.length]=this.menuCent=new MenuCent(this,function(s,p){	})


			self.menuCent.setSob("texturesList")



			/*this.localStorage = new LocalStorage(null, "tourzVeiw5");
            if(self.localStorage.object.debug == undefined)self.localStorage.object.debug = false;            
            this.param.debug=self.localStorage.object.debug;

            for(var s in self.localStorage.object){
            	if(this.param[s]!=undefined)this.param[s]=self.localStorage.object[s]
            }

        	window.dcmParam._boolLine=false;


        	window.dcmParam._fontFamily="Montserrat"


        	array[array.length]=this.korectColor=new KorectColor(this,function(s,p){	})
			



			array[array.length]=this.tView=tView=new TView(function(s,p){					
				
				if(s=="fun_rotationZ"){
					for (var i = 0; i < array.length; i++) {
						if(array[i].setRotation)array[i].setRotation(p)
					}	
				}

				if(s=="compliteImagePre"){
				
					self.korectColor.corektImageColor(p)
				}
				
			})
			this.dCont.div.appendChild(tView.div);
			tView.preLoader.active=true;

			


			

			array[array.length]=this.menuVorkug= new MenuVorkug(this,function(s,p,p1){
				if(s=="addDImage"){
					self.korectColor.addDImage(p);
				}
				if(s=="redragColor"){
					self.korectColor.redrag();
				}

				if(s=="bool"){
					self.bool=p;
				}
				if(s=="openView"){

					self.openObj(p)
				}
				if(s=="logo"){
					window.open(this.param.link);	
					
				}

				if(s=="menuHelp"){
					self.menuHelp.active=p
				}

			})

			array[array.length]=this.menuPlane=new MenuPlane(this,function(s,p,p1){
				if(s=="index")openView(p1)
	            if(s=="korectWH"){ 
	                sizeWindow();
	            }
			})

			array[array.length]=this.menuVideo=new MenuVideo(this,function(s,p,p1){
				if(s=="addDImage"){
					self.korectColor.addDImage(p);
				}
				if(s=="redragColor"){
					self.korectColor.redrag();
				}
			})



			array[array.length]=this.menuGal=new MenuGal(this,function(s,p,p1){
				if(s=="logo"){
					window.open(this.param.link);	
					
				}
				if(s=="bool1"){
					self.bool1=p
				}	
				if(s=="bool2"){
					self.bool2=p
				}	
				if(s=="addDImage"){
					self.korectColor.addDImage(p);
				}
				if(s=="redragColor"){
					self.korectColor.redrag();
				}
				if(s=="openObj"){

					self.openObj(p)
				}
			})

			


			

			

			
			array[array.length]=this.menuHelp=new MenuHelp(this,function(s,p,p1){
				if(s=="addDImage"){
					self.korectColor.addDImage(p);
				}
				if(s=="redragColor"){
					self.korectColor.redrag();
				}
			})

			array[array.length]=this.menuDebug=new MenuDebug(this,function(s,p,p1){



			})

			array[array.length]=this.menuError=new MenuError(this,function(s,p,p1){
				
			})


			array[array.length]=vsakoUr=new VsakoUr(function(s,p){	
				if(s=="openId")self.setObjTourz(p)
				if(s=="notToken"){		
					self.menuError.start("Tour wird nicht finden!")
				}
			})




			if(self.fun)self.fun("init")*/
		}

		

		this.setParam=function(){
			for (var i = 0; i < array.length; i++) {
				if(array[i].setParam)array[i].setParam();
			}

			this.sizeWindow()
		}
/*

		function openView(obj){
			//label.text=obj.text; 
			//label.visible=true
			if(obj.direkt==1) {
				self.openObj(obj)
				return
			} 
			        
	        let type=obj.type!= undefined ? obj.type :"pic";
	        let boolPreLoad=obj.boollaod!= undefined ? obj.boollaod :false;
	        let boolPreLink=obj.laod ? obj.laod.url :null;

	        let res=obj.pic.url!=undefined ? obj.pic.url : obj.pic; 
	        tView.setLink(type, res, boolPreLoad,boolPreLink);
	        tView.visi3D.rotationX=Math.PI/2;
	        tView.rotation=obj.rotation*Math.PI/180;
	        
	        self.menuVorkug.activId(obj.id);
	       	self.menuGal.activId(obj.id,obj);	
	        self.menuPlane.activId(obj.id,obj);
	        
	        self.menuHelp.activId(obj.id,obj);	
	        
		}




		this.objBaseTourz
		this.setObjTourz=function(o){
		
            this.objBaseTourz=o; 
			this.setObj(o.tourz)
			self.menuHelp.setObjTourz(o);	
		}
		this.objBase=undefined
		this.setObj=function(o){
            this.objBase=o;
            this.menuVorkug.setObj(this.objBase);
            this.menuGal.setObj(this.objBase);	
			this.openObj(this.objBase.array[0]);
			self.menuHelp.openObj(o);			
		}




	

		

			








		this.objDin=undefined;  
        this.openObj=function(o){ 
        	 
         	this.objDin=o         
			for (var i = 0; i < array.length; i++) {
				if(array[i].openObj)array[i].openObj(o);
			}	

			for (var i = 0; i < this.objDin.array.length; i++) {
				if(this.objDin.array[i].active==true){
					openView(this.objDin.array[i])
					return
				}
			}
			tView.notLink()
			
        }*/


        this.tick = function () {			
			TWEEN.update();
			requestAnimationFrame(self.tick);			
		}
		this.tick() 




		var s=1
		var w=this.maxW
		var h=this.maxH
  		this.sizeWindow = function(_w,_h){
  			if(_w){
  				w=_w
  				h=_h
  			}
  			//if (w < this.param.maxW) w = this.param.maxW;
			//if (h< this.param.maxH) h = this.param.maxH;
			
			s= w/100;
			if(s>h/100)s=h/100;


			if(s>1)s=1;

			
			this.dCont.scale=s;
  			
  			/*tView.sizeWindow(w/s, h/s);*/
  			for (var i = 0; i < array.length; i++) {
  			
  				
  				if(array[i].sizeWindow)array[i].sizeWindow(w,h,s);
  			}
  		}

  		this.init()
  		this.setParam()



  	}
/*
  	set bool(value) {
        if (this._bool != value) {
            this._bool = value;
            this.menuVorkug.bool= value; 
            this.menuPlane.bool= value;  
            this.menuGal.bool= value;                                  
        }             
    }
    get bool() { return this._bool; }

  	set bool1(value) {
        if (this._bool1 != value) {
            this._bool1 = value;
            this.menuGal.bool1= value;                                    
        }             
    }
    get bool1() { return this._bool1; }
   
  	set bool2(value) {
        if (this._bool2 != value) {
            this._bool2 = value;
            this.menuVorkug.bool2= value; 
            this.menuGal.bool2= value; 
            this.menuPlane.bool2= value; 
            this.menuVideo.active= value;                                   
        }             
    }
    get bool2() { return this._bool2; }
*/
/*
  	set anisotropy(value) {
        if (this._anisotropy != value) {
            this._anisotropy = value;
           	this.tView.sigment.anisotropy= value;                             
        }             
    }
    get anisotropy() { return this._anisotropy;}
*/
   



}



