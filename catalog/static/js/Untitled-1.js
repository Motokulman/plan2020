// канва для 3д



function main() {
    var canvas = document.querySelector('#canvas');
//   var canvas = document.querySelector('#c');
  var renderer = new THREE.WebGLRenderer({canvas});

  var fov = 75;
  var aspect = 2;  // the canvas default
  var near = 0.1;
  var far = 100;
  var camera = new THREE.PerspectiveCamera(fov, aspect, near, far);
  camera.position.z = 5;

  var scene = new THREE.Scene();

  {
    var color = 0xFFFFFF;
    var intensity = 1;
    var light = new THREE.DirectionalLight(color, intensity);
    light.position.set(-1, 2, 4);
    scene.add(light);
  }

  var geometry = new THREE.Geometry();
  geometry.vertices.push(
    new THREE.Vector3(-1, -1,  1),  // 0
    new THREE.Vector3( 1, -1,  1),  // 1
    new THREE.Vector3(-1,  1,  1),  // 2
    new THREE.Vector3( 1,  1,  1),  // 3
    new THREE.Vector3(-1, -1, -1),  // 4
    new THREE.Vector3( 1, -1, -1),  // 5
    new THREE.Vector3(-1,  1, -1),  // 6
    new THREE.Vector3( 1,  1, -1),  // 7
  );

  /*
       6----7
      /|   /|
     2----3 |
     | |  | |
     | 4--|-5
     |/   |/
     0----1
  */

  geometry.faces.push(
     // front
     new THREE.Face3(0, 3, 2),
     new THREE.Face3(0, 1, 3),
     // right
     new THREE.Face3(1, 7, 3),
     new THREE.Face3(1, 5, 7),
     // back
     new THREE.Face3(5, 6, 7),
     new THREE.Face3(5, 4, 6),
     // left
     new THREE.Face3(4, 2, 6),
     new THREE.Face3(4, 0, 2),
     // top
     new THREE.Face3(2, 7, 6),
     new THREE.Face3(2, 3, 7),
     // bottom
     new THREE.Face3(4, 1, 0),
     new THREE.Face3(4, 5, 1),
  );

  function makeInstance(geometry, color, x) {
    var material = new THREE.MeshBasicMaterial({color});

    var cube = new THREE.Mesh(geometry, material);
    scene.add(cube);

    cube.position.x = x;
    return cube;
  }

  var cubes = [
    makeInstance(geometry, 0x44FF44,  0),
    makeInstance(geometry, 0x4444FF, -4),
    makeInstance(geometry, 0xFF4444,  4),
  ];

  function resizeRendererToDisplaySize(renderer) {
    var canvas = renderer.domElement;
    var width = canvas.clientWidth;
    var height = canvas.clientHeight;
    var needResize = canvas.width !== width || canvas.height !== height;
    if (needResize) {
      renderer.setSize(width, height, false);
    }
    return needResize;
  }

  function render(time) {
    time *= 0.001;

    if (resizeRendererToDisplaySize(renderer)) {
      var canvas = renderer.domElement;
      camera.aspect = canvas.clientWidth / canvas.clientHeight;
      camera.updateProjectionMatrix();
    }

    cubes.forEach((cube, ndx) => {
      var speed = 1 + ndx * .1;
      var rot = time * speed;
      cube.rotation.x = rot;
      cube.rotation.y = rot;
    });

    renderer.render(scene, camera);

    requestAnimationFrame(render);
  }

  requestAnimationFrame(render);
}

main();
