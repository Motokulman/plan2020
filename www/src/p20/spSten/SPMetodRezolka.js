

import { PlaneXZ } from '../plus/PlaneXZ.js';
import { GronTriangle } from './colozi/GronTriangle.js';
//Для отрезания граний	
	
export class SPMetodRezolka  {
    constructor(par) {     
		this.type = 'SPMetodRezolka';
		this.par=par;

		this.cont3dL = new THREE.Object3D();
	    this.par.content3d.add(this.cont3dL); 
		
	    this.cont3dL.position.x=1200
		//this.cont3dL.rotation.x=Math.PI/2;

		this.plane=new PlaneXZ()
		this.plane1=new PlaneXZ()
		this.plane2=new PlaneXZ()
		
		this.gronTriangle=new GronTriangle()

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

        var sten
        var arrGrani
		this.setStenGrani=function(_sten, _arrGrani){
			sten=_sten
			arrGrani=_arrGrani
			this.plane.clear()
			this.plane1.clear()	
			this.plane2.clear()	
		



			

			trace("arrGrani   ",arrGrani)
			for (var i = 0; i < arrGrani.length; i++) {
				arrGrani[i].clearAL()
			}


			
			for (var i = 0; i < this.par.arrPol.length; i++) {
				if (this.par.arrPol[i].life==false) continue;
				this.sort1(this.par.arrPol[i])
			}






			this.plane.upDate();
			this.plane1.upDate();
			this.plane2.upDate();
		}


		this.arrTiang=[]
		this.aTSten=[[new THREE.Vector3(),new THREE.Vector3(),new THREE.Vector3()],[new THREE.Vector3(),new THREE.Vector3(),new THREE.Vector3()]]
		var shTr;

		var gronSten,gronSten1
		//Проврка на полигоны
		this.sort1=function(_poli){
			
			shTr=-1
			
			for (var i = 0; i < _poli.shTr; i++) {
				shTr++;
				if(this.arrTiang[shTr]==undefined){
					this.arrTiang[shTr]=[new THREE.Vector3(),new THREE.Vector3(),new THREE.Vector3()]
				}
				this.arrTiang[shTr][0].set(_poli.arrTiang[i][0].x,_poli.arrTiang[i][0].y,_poli.arrTiang[i][0].z);
				this.arrTiang[shTr][1].set(_poli.arrTiang[i][1].x,_poli.arrTiang[i][1].y,_poli.arrTiang[i][1].z);
				this.arrTiang[shTr][2].set(_poli.arrTiang[i][2].x,_poli.arrTiang[i][2].y,_poli.arrTiang[i][2].z);

				this.plane.addLine(this.arrTiang[shTr][0].clone(),this.arrTiang[shTr][1].clone())
				this.plane.addLine(this.arrTiang[shTr][1].clone(),this.arrTiang[shTr][2].clone())
				this.plane.addLine(this.arrTiang[shTr][2].clone(),this.arrTiang[shTr][0].clone())				
			}
			
			

			shTr++

			gronSten=arrGrani[0].arr[2];
			gronSten1=arrGrani[2].arr[2];
			

			this.sort2(arrGrani[0].arrPGlob[2],arrGrani[0].arrPGlob[3], sten.height+sten.height1)	

			

		
			
			this.par.render()
			
		}	

		this.arrLine3D=[]
		var sah3

		this.sort2=function(p,p1,z){
			

			this.mesh1.position.copy(p1)
			this.mesh.position.copy(p)

			this.aTSten[0][0].set(p.x,p.y,-z);
			this.aTSten[0][1].set(p1.x,p1.y,0);
			this.aTSten[0][2].set(p.x,p.y,0);

			this.aTSten[1][0].set(p.x,p.y,-z);
			this.aTSten[1][1].set(p1.x,p1.y,-z);
			this.aTSten[1][2].set(p1.x,p1.y,0);


			

			this.plane1.addLine(this.aTSten[0][0],this.aTSten[0][1])
			this.plane1.addLine(this.aTSten[0][1],this.aTSten[0][2])
			this.plane1.addLine(this.aTSten[0][2],this.aTSten[0][0])

			this.plane1.addLine(this.aTSten[1][0],this.aTSten[1][1])
			this.plane1.addLine(this.aTSten[1][1],this.aTSten[1][2])
			this.plane1.addLine(this.aTSten[1][2],this.aTSten[1][0])




		


			sah3=0;
			this.sort3(this.aTSten,2,this.arrTiang,shTr)

		}

		var gsObj,gsObj1
		this.sort3=function(paska,k,paska1,k1){
			

			




			//this.sort4(paska[0],paska1[0])
			
			for (var i = 0; i < k; i++) {				
				for (var j = 0; j < k1; j++) {					
					this.sort4(paska[i],paska1[j])
				}
			}
			
		}
		var pt=new THREE.Vector3()
		var pt1=new THREE.Vector3()

		var ptR=new THREE.Vector3()	
		var ptR1=new THREE.Vector3()
		var rez
		this.sort4=function(tr,tr1){
			
			/*pt.set(tr[0].x,tr[0].y,tr[0].z);
			pt1.set(tr[1].x*0.5+tr[0].x*0.5,tr[1].y*0.5+tr[0].y*0.5,tr[1].z*0.5+tr[0].z*0.5);
			ptR=gronSten.isLocalToGlob(pt,pt1);			
			gsObj1.p.x=gsObj.p.x=ptR.p.x;
			gsObj1.p.y=gsObj.p.y=-ptR.p.z;


			gsObj1.p1.x=gsObj.p1.x=ptR.p1.x;
			gsObj1.p1.y=gsObj.p1.y=-ptR.p1.z;*/

			

			rez=this.gronTriangle.setT(tr,tr1);
			
			
			if(rez!=null){
				gsObj=gronSten.getLine();
				gsObj1=gronSten1.getLine();
				
				ptR=gronSten.isLocalToGlob(rez[0],rez[1]);			
				gsObj1.p.x=gsObj.p.x=ptR.p.x;
				gsObj1.p.y=gsObj.p.y=ptR.p.z;


				gsObj1.p1.x=gsObj.p1.x=ptR.p1.x;
				gsObj1.p1.y=gsObj.p1.y=ptR.p1.z;

				this.plane2.addLine({x:rez[0].x,y:rez[0].y,z:rez[0].z},{x:rez[1].x,y:rez[1].y,z:rez[1].z})




			}

		}


		var rezX=[new THREE.Vector3(),new THREE.Vector3()];
		var kolSS
		this.inTri=function(tr,tr1){
			kolSS=0;
			



		}

		//re = this.getPointOfIntersection(p1, p2, pTest1, pTest2);





	}

}


