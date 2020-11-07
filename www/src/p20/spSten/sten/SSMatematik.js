
export class SSMatematik  {
  	constructor(par,fun) {  
  		var self = this;		
  		this.type="SSMatematik";
  		this.par=par
  		this.fun=fun

  		this.position=par.position
  		this.position1=par.position1		
		this.arrGran=par.arrGran
		this.arrPosit=par.arrPosit
		this.arrPosit1=par.arrPosit1
		this.rectBig=par.rectBig
		this.uuid=par.rectBig




  		var a1,d1,a
		var pNull=new Position()
  		this.poiskGran=function(){
			
			a=calc.getAngle(this.position, this.position1);		
			this.arrGran[0].set(this.arrPosit[0].x,this.arrPosit[0].y);
			a1=calc.getAngle(pNull, this.arrGran[0]);
	        d1=calc.getDistance(pNull, this.arrGran[0]);
	        calc.getVector(d1,a-a1-Math.PI,this.arrGran[0])
	        this.arrGran[0].x+=this.position.x;
	        this.arrGran[0].y+=this.position.y;

	    


	        this.arrGran[1].set(this.arrPosit1[5].x,this.arrPosit1[5].y);
			a1=calc.getAngle(pNull, this.arrGran[1]);
	        d1=calc.getDistance(pNull, this.arrGran[1]);
	        calc.getVector(d1,a+a1,this.arrGran[1])

	        this.arrGran[1].x+=this.position1.x;
	        this.arrGran[1].y+=this.position1.y;




	        this.arrGran[2].set(-this.arrPosit1[0].x,this.arrPosit1[0].y);
			a1=calc.getAngle(pNull, this.arrGran[2]);
	        d1=calc.getDistance(pNull, this.arrGran[2]);
	        calc.getVector(d1,a-a1+Math.PI,this.arrGran[2])
	        this.arrGran[2].x+=this.position1.x;
	        this.arrGran[2].y+=this.position1.y;


	        this.arrGran[3].set(-this.arrPosit[5].x,this.arrPosit[5].y);
			a1=calc.getAngle(pNull, this.arrGran[3]);
	        d1=calc.getDistance(pNull, this.arrGran[3]);
	        calc.getVector(d1,a+a1,this.arrGran[3])
	        this.arrGran[3].x+=this.position.x;
	        this.arrGran[3].y+=this.position.y;

	        this.rectBig.x=99999999999
	        this.rectBig.y=99999999999
	        this.rectBig.x1=-29999999999
	        this.rectBig.y1=-29999999999
	        for (var i = 0; i < this.arrGran.length; i++) {
	        	if(this.rectBig.x>this.arrGran[i].x)this.rectBig.x=this.arrGran[i].x
	        	if(this.rectBig.x1<this.arrGran[i].x)this.rectBig.x1=this.arrGran[i].x
	        	if(this.rectBig.y>this.arrGran[i].y)this.rectBig.y=this.arrGran[i].y
	        	if(this.rectBig.y1<this.arrGran[i].y)this.rectBig.y1=this.arrGran[i].y	
	        }
	    	this.rectBig.w=this.rectBig.x1-this.rectBig.x
	        this.rectBig.h=this.rectBig.y1-this.rectBig.y
	        //this.rectBig.y-=this.rectBig.h;
	     


		}


		var rez,bp,bp1,res
		var arrayCol=[]
		this.isRect=function(r,b){
		
			if(b==undefined)this.poiskGran();	
			if(calc.isRectS(r,this.rectBig)==true){
				arrayCol.length=0
				bp=calc.isRectPoint(r, this.position);
				bp1=calc.isRectPoint(r, this.position1);
				if(bp==true||bp1==true){
					if(bp==true)arrayCol.push(this.par.addPoint);
					if(bp1==true)arrayCol.push(this.par.addPoint1);	
				}

				trace(arrayCol)
				if(arrayCol.length!=0&&arrayCol[0].uuid!=this.uuid)arrayCol.unshift(this.par);

				if(arrayCol.length==0){//Ищем по массиву линий краюв
					for (var i = 0; i < this.arrGran.length; i+=2) {
						res=calc.isRectLine(r, this.arrGran[i], this.arrGran[i+1]);
						if(res==true){
							arrayCol.unshift(this);
							break;
						}
					}
				}

				
				if(arrayCol.length!=0){
					for (var i = 0; i < this.par.windows.array.length; i++) {
						arrayCol.push(this.par.windows.array[i])
					}
					return arrayCol;
				}
			}
			return null;
		}




		//////////////////////////////
		var p,p1,p2
		var bb,a,pr;
		var sten;
		var pp,pp1,pp2
		this.korectOffset=function(){
			if(this.par.sUi!=-1){
				bb=false;
				this.par.offset=0
				if(sten!=undefined)if(sten.uuid==this.par.sUi)if(sten.life==true){//уже нашли и она ок				
					bb=true;
				}
				if(this.par._addPoint==undefined)return
				if(this.par._addPoint1==undefined)return	

				if(bb==false){//ищем стенку к, если есть в списке
					if(sten==undefined){
						for (var i = 0; i < this.par.stage.arrSplice.length; i++) {
							if(this.par.stage.arrSplice[i].life==false)continue;
							if(this.par.stage.arrSplice[i].uuid==this.par.sUi){
								sten=this.par.stage.arrSplice[i]
								bb=true;
							}
						}
					}
				}

				if(bb==true){
					
					p=null;
					p1=null;
					p2=null;
					
					if(this.par._addPoint._uuid==sten._addPoint._uuid){//0=0
						p=this.par._addPoint1
						p1=this.par._addPoint
						p2=sten._addPoint1
					}

					if(this.par._addPoint1._uuid==sten._addPoint._uuid){//1=0
						p=this.par._addPoint
						p1=this.par._addPoint1
						p2=sten._addPoint1
					}

					if(this.par._addPoint._uuid==sten._addPoint1._uuid){//0=0
						p=this.par._addPoint1
						p1=this.par._addPoint
						p2=sten._addPoint
					}

					if(this.par._addPoint1._uuid==sten._addPoint1._uuid){//1=0
						p=this.par._addPoint
						p1=this.par._addPoint1
						p2=sten._addPoint
					}


					if(p!=null){
						a=calc.getTreeAngel(p.position,p1.position,p2.position,true)
						pr=(a-Math.PI)/Math.PI;				
						
						if(this.par._bChaz==false){
							if(pr==1)pr=-1
							pp=this.par.delph/2-sten.delph/2;//центр
							pp1=sten.delph//лево
											
							if(pr<=0){
								this.par.offset=pp-pr*pp1
							}else{
								this.par.offset=pp//-pr*pp2
							}
						}else{
							pp=-(this.par.delph/2-sten.delph/2);//центр
							pp1=sten.delph//лево									
							if(pr>=0){
								this.par.offset=pp-pr*pp1
							}else{
								this.par.offset=pp//-pr*pp2
							}
						}
					}				
				}		
			}
		}



  		
       /* this.getObj=function(){
            var o={}
            o.array=[]
         	for (var i = 0; i < this.array.length; i++) {
         		o.array.push(this.array[i].getObj())
         	}
            return  o
        }*/


  	}

   /* set delph(value) {      
        if(this._delph!=value){
            this._delph= value;            
            for (var i = 0; i < this.array.length; i++) {
                this.array[i].delph = value;
            }
        }
    }    
    get delph() { return  this._delph;}*/

}

