

import { PlaneXZ } from '../plus/PlaneXZ.js';
import { GronTriangle } from './colozi/src/src/menu/GronTriangle.js';
//Для отрезания граний	
	
export class SPMetodRezolka  {
    constructor(par) {     
		this.type = 'SPMetodRezolka';
		this.par=par;

		
		//this.cont3dL.rotation.x=Math.PI/2;

		var debug=false;

		
		
		this.gronTriangle=new GronTriangle()

		if(debug==true){
			this.cont3dL = new THREE.Object3D();
	    	this.par.content3d.add(this.cont3dL); 
		
	    	this.cont3dL.position.x=1200;

			this.plane=new PlaneXZ();
			this.plane1=new PlaneXZ();
			this.plane2=new PlaneXZ();


			this.lineSegments = new THREE.LineSegments(
	         	this.plane,
	         	this.par.lineBasicMaterial
	        )
	        this.cont3dL.add(this.lineSegments);        

	        this.lineSegments1 = new THREE.LineSegments(
	         	this.plane1,
	         	this.par.lineBasicMaterial1
	        )
	        this.cont3dL.add(this.lineSegments1);

	        this.lineSegments2 = new THREE.LineSegments(
	         	this.plane2,
	         	this.par.lineBasicMaterial2
	        )
	        this.cont3dL.add(this.lineSegments2);

	        this.mesh=new THREE.Mesh(this.par.boxBufferGeometry)
	        this.mesh.scale.set(30,30,30)
			this.cont3dL.add(this.mesh)

			this.mesh1=new THREE.Mesh(this.par.boxBufferGeometry)
	        this.mesh1.scale.set(60,60,60)
			this.cont3dL.add(this.mesh1)
		}


        var sten;
        var arrGrani;
		this.setSten=function(_sten){
			//чистим линии в стенах
			
			if(debug==true){
				this.plane.clear()
				this.plane1.clear()	
				this.plane2.clear()	
			}

			


			sten=_sten;
			arrGrani=sten.ss3d.arrGrani;

			for (var i = 0; i < _sten.ss3d.arrGrani.length; i++) {
				_sten.ss3d.arrGrani[i].clearAL();
			}
			
			this.sortStenPoint(_sten)
			

			

			
			
			for (var i = 0; i < this.par.arrPol.length; i++) {
				if (this.par.arrPol[i].life==false) continue;
				this.sort1(this.par.arrPol[i]);
			}

			if(debug==true){
				this.plane.upDate();
				this.plane1.upDate();
				this.plane2.upDate();
			}
		}


		this.pol
		this.setPol=function(_poli){
			
			this.pol=_poli

			if(debug==true){
				this.plane.clear()
				this.plane1.clear()	
				this.plane2.clear()	
			}

			/*shTr=-1			
			for (var i = 0; i < _poli.shTr; i++) {
				shTr++;
				if(this.arrTiang[shTr]==undefined){
					this.arrTiang[shTr]=[new THREE.Vector3(),new THREE.Vector3(),new THREE.Vector3()]
				}
				this.arrTiang[shTr][0].set(_poli.arrTiang[i][0].x,_poli.arrTiang[i][0].y,_poli.arrTiang[i][0].z);
				this.arrTiang[shTr][1].set(_poli.arrTiang[i][1].x,_poli.arrTiang[i][1].y,_poli.arrTiang[i][1].z);
				this.arrTiang[shTr][2].set(_poli.arrTiang[i][2].x,_poli.arrTiang[i][2].y,_poli.arrTiang[i][2].z);
				
				if(debug==true){
					this.plane.addLine(this.arrTiang[shTr][0].clone(),this.arrTiang[shTr][1].clone())
					this.plane.addLine(this.arrTiang[shTr][1].clone(),this.arrTiang[shTr][2].clone())
					this.plane.addLine(this.arrTiang[shTr][2].clone(),this.arrTiang[shTr][0].clone())
				}				
			}
			shTr++*/






			for (var i = 0; i < this.par.arrSplice.length; i++) {
				if (this.par.arrSplice[i].life==false) continue;
					//this.setSten(this.par.arrSplice[i])
					this.sort1OtPol(this.par.arrSplice[i], _poli.arrTiang, _poli.shTr)

				//this.sort1(this.par.arrPol[i]);
			}

			if(debug==true){
				this.plane.upDate();
				this.plane1.upDate();
				this.plane2.upDate();
			}

		}

		var zz,bbb
		var pn=new THREE.Vector3()
		var pn1=new THREE.Vector3()
		var pn2=new THREE.Vector3()
		var pn_=new THREE.Vector3()
		var pn1_=new THREE.Vector3()


		this.sortStenPoint=function(_sten){
			//Отрезалка от точке стены
			return
			bbb=false
			zz=_sten.height+_sten.height1;
			
			if(_sten._addPoint.position.z<zz){				
				bbb=true;
			}
			if(_sten._addPoint1.position.z<zz){				
				bbb=true;
			}
			if(bbb==true){

				calc.getVector(_sten._delph,Math.PI/2+_sten._rotation, pn2);
				pn.x=_sten._addPoint.position.x+pn2.x;
				pn.y=_sten._addPoint.position.y+pn2.y;
				pn.z=-_sten._addPoint.position.z;

				pn1.x=_sten._addPoint1.position.x+pn2.x;
				pn1.y=_sten._addPoint1.position.y+pn2.y;
				pn1.z=-_sten._addPoint1.position.z;

				this.zdvihPoint(pn,pn1,_sten._delph*2);
				this.zdvihPoint(pn1,pn,_sten._delph*4);

				calc.getVector(_sten._delph,-Math.PI/2+_sten._rotation, pn2);
				pn_.x=_sten._addPoint.position.x+pn2.x;
				pn_.y=_sten._addPoint.position.y+pn2.y;
				pn_.z=-_sten._addPoint.position.z;

				pn1_.x=_sten._addPoint1.position.x+pn2.x;
				pn1_.y=_sten._addPoint1.position.y+pn2.y;
				pn1_.z=-_sten._addPoint1.position.z;

				this.zdvihPoint(pn_,pn1_,_sten._delph*2);
				this.zdvihPoint(pn1_,pn_,_sten._delph*4);


				//this.plane.addLine(pn,pn1);
				//this.plane.addLine(pn_,pn1_);


				shTr=0
				this.arrTiang[shTr]=[new THREE.Vector3(),new THREE.Vector3(),new THREE.Vector3()]
				this.arrTiang[shTr][0].set(pn.x,	pn.y,	pn.z);
				this.arrTiang[shTr][1].set(pn1.x,	pn1.y,	pn1.z);
				this.arrTiang[shTr][2].set(pn_.x,	pn_.y,	pn_.z);
			

				shTr=1	
				this.arrTiang[shTr]=[new THREE.Vector3(),new THREE.Vector3(),new THREE.Vector3()]
				this.arrTiang[shTr][0].set(pn1.x,	pn1.y,	pn1.z);
				this.arrTiang[shTr][1].set(pn1_.x,	pn1_.y,	pn1_.z);
				this.arrTiang[shTr][2].set(pn_.x,	pn_.y,	pn_.z);
				

				shTr=2

				for (var i = 0; i < 5; i++) {
					gronSten=arrGrani[0].arr[i];
					gronSten1=arrGrani[2].arr[i];
					this.sort2(arrGrani[0].arrPGlob[i],arrGrani[0].arrPGlob[i+1], sten.height+sten.height1, this.arrTiang, shTr)
				}

				for (var i = 0; i < 5; i++) {
					gronSten=arrGrani[1].arr[i];
					gronSten1=arrGrani[3].arr[i];
					this.sort2(arrGrani[1].arrPGlob[i],arrGrani[1].arrPGlob[i+1], sten.height+sten.height1, this.arrTiang, shTr)
				}

			
			}

		}





		this.sort1OtPol=function(_sten, _arrTiang, _shTr){
			if(calc.isRectS(_sten.rectBig,this.pol.rectBig)==false)return;
			
			if(_sten.par._boolMax==false){
				_sten.par.addObjFun1(_sten)
				return;
			}
			this.setSten(_sten)
			/*this.sortStenPoint(sten)

			sten=_sten
			arrGrani=sten.ss3d.arrGrani	


			//чистим линии в стенах
			for (var i = 0; i < arrGrani.length; i++) {
				arrGrani[i].clearAL();
			}
			
			for (var i = 0; i < 5; i++) {
				gronSten=arrGrani[0].arr[i];
				gronSten1=arrGrani[2].arr[i];
				this.sort2(arrGrani[0].arrPGlob[i],arrGrani[0].arrPGlob[i+1], sten.height+sten.height1, _arrTiang, _shTr);
			}

			for (var i = 0; i < 5; i++) {
				gronSten=arrGrani[1].arr[i];
				gronSten1=arrGrani[3].arr[i];
				this.sort2(arrGrani[1].arrPGlob[i],arrGrani[1].arrPGlob[i+1], sten.height+sten.height1, _arrTiang, _shTr);
			}
			*/



			sten.ss3d.drawVerg()

		}



		var pasTri

		this.arrTiang=[]
		this.aTSten=[[new THREE.Vector3(),new THREE.Vector3(),new THREE.Vector3()],[new THREE.Vector3(),new THREE.Vector3(),new THREE.Vector3()]]
		var shTr;
		var gronSten,gronSten1
		//Проврка на полигоны
		this.sort1=function(_poli){

			if(calc.isRectS(sten.rectBig,_poli.rectBig)==false)return;
			
			


			
			//перебор треугольников крышы в нужный нам
			/*shTr=-1			
			for (var i = 0; i < _poli.shTr; i++) {
				shTr++;
				if(this.arrTiang[shTr]==undefined){
					this.arrTiang[shTr]=[new THREE.Vector3(),new THREE.Vector3(),new THREE.Vector3()]
				}
				this.arrTiang[shTr][0].set(_poli.arrTiang[i][0].x,_poli.arrTiang[i][0].y,_poli.arrTiang[i][0].z);
				this.arrTiang[shTr][1].set(_poli.arrTiang[i][1].x,_poli.arrTiang[i][1].y,_poli.arrTiang[i][1].z);
				this.arrTiang[shTr][2].set(_poli.arrTiang[i][2].x,_poli.arrTiang[i][2].y,_poli.arrTiang[i][2].z);
				
				if(debug==true){
					this.plane.addLine(this.arrTiang[shTr][0].clone(),this.arrTiang[shTr][1].clone())
					this.plane.addLine(this.arrTiang[shTr][1].clone(),this.arrTiang[shTr][2].clone())
					this.plane.addLine(this.arrTiang[shTr][2].clone(),this.arrTiang[shTr][0].clone())
				}				
			}
			shTr++*/
			shTr=_poli.shTr;
			pasTri=_poli.arrTiang;


			/**/
				for (var i = 0; i < 5; i++) {
				gronSten=arrGrani[0].arr[i];
				gronSten1=arrGrani[2].arr[i];
				this.sort2(arrGrani[0].arrPGlob[i],arrGrani[0].arrPGlob[i+1], sten.height+sten.height1, _poli.arrTiang, _poli.shTr)
			}

			for (var i = 0; i < 5; i++) {
				gronSten=arrGrani[1].arr[i];
				gronSten1=arrGrani[3].arr[i];
				this.sort2(arrGrani[1].arrPGlob[i],arrGrani[1].arrPGlob[i+1], sten.height+sten.height1, _poli.arrTiang, _poli.shTr)
			}

			/*	
			var i=4
			var j=1
			gronSten=arrGrani[j].arr[i];
			gronSten1=arrGrani[j+2].arr[i];
			this.sort2(arrGrani[j].arrPGlob[i],arrGrani[j].arrPGlob[i+1], sten.height+sten.height1)
			
*/

			this.par.render()			
		}	

		this.arrLine3D=[]
		var sah3
		var dd
		this.sort2=function(p,p1,z,_arrTri,_shTr){
			dd=calc.getDistance(p,p1)
			
			if(dd==0)return
			if(debug==true){
				this.mesh1.position.copy(p1)
				this.mesh.position.copy(p)

				for (var i = 0; i < _shTr; i++) {
					this.plane.addLine(_arrTri[i][0].clone(),_arrTri[i][1].clone())
					this.plane.addLine(_arrTri[i][1].clone(),_arrTri[i][2].clone())
					this.plane.addLine(_arrTri[i][2].clone(),_arrTri[i][0].clone())
				}
			}

			//собераем треугольники стен
			this.aTSten[0][0].set(p.x,p.y,-z);
			this.aTSten[0][1].set(p1.x,p1.y,0);
			this.aTSten[0][2].set(p.x,p.y,0);

			this.aTSten[1][0].set(p.x,p.y,-z);
			this.aTSten[1][1].set(p1.x,p1.y,-z);
			this.aTSten[1][2].set(p1.x,p1.y,0);
			
			if(debug==true){
				this.plane1.addLine(this.aTSten[0][0].clone(),this.aTSten[0][1].clone())
				this.plane1.addLine(this.aTSten[0][1].clone(),this.aTSten[0][2].clone())
				this.plane1.addLine(this.aTSten[0][2].clone(),this.aTSten[0][0].clone())

				this.plane1.addLine(this.aTSten[1][0].clone(),this.aTSten[1][1].clone())
				this.plane1.addLine(this.aTSten[1][1].clone(),this.aTSten[1][2].clone())
				this.plane1.addLine(this.aTSten[1][2].clone(),this.aTSten[1][0].clone())
			}
			sah3=0;
			this.sort3(this.aTSten,2,_arrTri,_shTr)
		}


		var gsObj,gsObj1
		this.sort3=function(paska,k,paska1,k1){
			
			for (var i = 0; i < k; i++) {//стены				
				for (var j = 0; j < k1; j++) {//крыша					
					this.sort4(paska[i],paska1[j])
				}
			}			
		}		

		var ptR=null		
		var rez=null
		this.sort4=function(tr,tr1){
			rez=this.gronTriangle.setT(tr,tr1);//прверка на пересечение треугольников			
			if(rez!=null){

				gsObj=gronSten.getLine();//обьекты линий на стенвх
				gsObj1=gronSten1.getLine();

				ptR=gronSten.isLocalToGlob(rez[0],rez[1]);	//инвертируем точки на стены в нутри ss3d 					
				gsObj1.p.x=gsObj.p.x=ptR.p.x;
				gsObj1.p.y=gsObj.p.y=ptR.p.z;
				gsObj1.p1.x=gsObj.p1.x=ptR.p1.x;
				gsObj1.p1.y=gsObj.p1.y=ptR.p1.z;

				if(debug==true)this.plane2.addLine({x:rez[0].x,y:rez[0].y,z:rez[0].z},{x:rez[1].x,y:rez[1].y,z:rez[1].z})
			}
			//моно взять треугольники
			/*var json={}
			json.tr=tr
			json.tr1=tr1
			var s=JSON.stringify(json)
			trace(s)*/
		}






		var vert=new THREE.Vector3()
		var dd
		this.zdvihPoint=function(p,p1,ot){
			vert.set(p1.x-p.x,p1.y-p.y,p1.z-p.z);
			dd=calc.getDistance(p,p1)
			
			p1.x=p.x+vert.x*((dd+ot)/dd)
			p1.y=p.y+vert.y*((dd+ot)/dd)
			p1.z=p.z+vert.z*((dd+ot)/dd)
		}	









	}






}


