// канва для 3д
var canvas = document.querySelector('#canvas');
var renderer = new THREE.WebGLRenderer({ canvas });
renderer.setPixelRatio(window.devicePixelRatio);
var fov = 75;
var aspect = canvas.clientWidth / canvas.clientHeight;  // значение для canvas по умолчанию
var mousePos3d = [{ x: 100, y: 100 }];

var near = 0.1;
var far = 100;
var camera = new THREE.PerspectiveCamera(fov, aspect, near, far);
camera.position.z = 5;
var scene = new THREE.Scene();
scene.background = new THREE.Color(0xAAAAAA);


{
    var color = 0xFFFFFF;
    var intensity = 1;
    var light = new THREE.DirectionalLight(color, intensity);
    light.position.set(-3, 3, 4);
    scene.add(light);
}

// var boxWidth = 10;
// var boxHeight = 10;
// var boxDepth = 10;
// var geometry = new THREE.BoxGeometry(boxWidth, boxHeight, boxDepth);
var geometry = new THREE.Geometry();
geometry.vertices.push(
    new THREE.Vector3(-1, -1, 1),  // 0
    new THREE.Vector3(1, -1, 1),  // 1
    new THREE.Vector3(-1, 1, 1),  // 2
    new THREE.Vector3(1, 1, 1),  // 3
    new THREE.Vector3(-1, -1, -1),  // 4
    new THREE.Vector3(1, -1, -1),  // 5
    new THREE.Vector3(-1, 1, -1),  // 6
    new THREE.Vector3(1, 1, -1),  // 7
);
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

// geometry.computeFaceNormals();
geometry.computeVertexNormals();

var material = new THREE.MeshPhongMaterial({color: 0x44aa88}); // side: THREE.DoubleSide, // отрисовка обратной стороны. Замедляет, и не всегда нужна

// настройка материала:
// const hue = 0.33;
// const saturation = 1;
// const luminance = .5;
// material.color.setHSL(hue, saturation, luminance);
// console.log('material = ', material);

// 
var cube = new THREE.Mesh(geometry, material);
// cube.position.x = 10;
// cube.position.y = 10;
// cube.position.z = 50;

// настройка 

function get3D() {
    scene.add(cube);
    renderer.render(scene, camera);
}

function render() {
    // time *= 0.001;  // конвертировать время в секунды
    // console.log('mousePos3d = ', mousePos3d);
    cube.rotation.y = - mousePos3d.x / 100;
    cube.rotation.x = mousePos3d.y / 100;
    renderer.render(scene, camera);
    requestAnimationFrame(render);
}

var pressed = false;
canvas.addEventListener('mousemove', function (e) {
    if (pressed) {
        mousePos3d = getMousePos(canvas, e);
    }
});

canvas.addEventListener('mousedown', function (e) {
    pressed = true;
    requestAnimationFrame(render);
});

canvas.addEventListener('mouseup', function (e) {
    pressed = false;
    cancelAnimationFrame(render);
});

canvas.addEventListener('mouseout', function (e) {
    pressed = false;
    cancelAnimationFrame(render);
});
