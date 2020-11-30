
	
	
export class SPMetod  {
    constructor(par) {     
		this.type = 'SPMetod';
		this.par=par;

		var p,p1,pol,bool,aaa,aaa1
		this.getFloor=function(floor){
			
			if(floor==undefined)return;
			this.par.clear();
		
			for (var i = 0; i < floor.arrSplice.length; i++) {
				if (floor.arrSplice[i].life == false) continue;
				p=floor.arrSplice[i].getObj();
				p1=this.par.craetSplice1();

				if(this.par.idArr==0){
					trace(">>>>",p)
					p.windows.array=[]
				}

				p1.setObj(p);

				


				/*p1.setObj(p);
				trace("@@@@",this.par.craetSplice());
				//p1 = new this.par.craetSplice1();
				trace(i,p,p1)*/				
			}

			for (var j = 0; j < floor.arrPol.length; j++) {			
				if (floor.arrPol[j].life==false) continue;

				if(this.par.idArr==0){//ищем дополнительные стены
					pol=floor.arrPol[j];

					for (var i = 0; i < pol.array.length; i++) {
							
						if(i==0){
							aaa=pol.array[i]
							aaa1=pol.array[pol.array.length-1]							
						}else{
							aaa=pol.array[i]
							aaa1=pol.array[i-1]	
						}
						if(this.testAdAdSten(aaa,aaa1)==false){							
							p={
								position:{x:aaa.position.x,y:aaa.position.y},
								position1:{x:aaa1.position.x,y:aaa1.position.y}
							};
							p.type="SpliceSten";
							p.adjacent=true;
							p.bChaz=false;
							p.carrier=true;						
							p1=this.par.craetSplice1();
							p1.setObj(p);


						}
					}
				}
			}

		}



		this.testAdAdSten=function(_ad,_ad1){
			
			if(_ad.arrIdSten.length==0)return false
			if(_ad1.arrIdSten.length==0)return false

			for (let i = 0; i < _ad.arrIdSten.length; i++) {
				for (let j = 0; j < _ad1.arrIdSten.length; j++) {
					if(_ad1.arrIdSten[j]==_ad.arrIdSten[i])return true
				}
			}	



			return false
		}
	}

}


