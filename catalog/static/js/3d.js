// канва для 3д
function make3d() {
    var canvas = document.querySelector('#canvas');
    var renderer = new THREE.WebGLRenderer({ canvas });
    renderer.setPixelRatio(window.devicePixelRatio);
    var fov = 120;
    var aspect = canvas.clientWidth / canvas.clientHeight;  // значение для canvas по умолчанию
    var mousePos3d = [{ x: 100, y: 100 }];

    var near = 0.1;
    var far = 50000;
    var camera = new THREE.PerspectiveCamera(fov, aspect, near, far);
    // camera.position.z = 5000;
    var controls = new OrbitControls(camera, renderer.domElement);
    camera.position.set(0, -100, 5000);
    controls.update();
    var scene = new THREE.Scene();
    scene.background = new THREE.Color(0xAAAAAA);


    {
        var color = 0xFFFFFF;
        var intensity = 1;
        var light = new THREE.DirectionalLight(color, intensity);
        light.position.set(-3, 3, 4);
        scene.add(light);
    }


    for (element of elements.values()) {
        if (element.type == "wall") {
        for (line_id of element.ids.values()) {
            var line = lines.find(line => line.id == line_id);
            var vert3D = getVertices(line);
            var vert2D = get2DFrom3DVertices(vert3D);

            var geometry = new THREE.Geometry();
            for (v of vert3D.values()) {
                var a = new THREE.Vector3(v.x, v.y, v.z);
                geometry.vertices.push(a);
            }
            console.log("vert2D = ", vert2D);
            var triangles = Delaunay.triangulate(vert2D);
            console.log("triangles = ", triangles);
            for (i = 0; i < triangles.length; i = i + 3) {
                var a = new THREE.Face3(triangles[i], triangles[i + 1], triangles[i + 2]);
                geometry.faces.push(a);
            }
            // console.log("geometry = ", geometry);
            // удалим из геометрии стены все имеющиеся ниши под окна, двери и т.д.
            for (j = geometry.faces.length - 1; j >= 0; j--) {
                var flag_a = false;
                var flag_b = false;
                var flag_c = false;
                for (i = 0; i < vert2D.length; i++) {
                    if (vert3D[i].type == "transparent") {
                        if (geometry.faces[j].a == i) flag_a = true;
                        if (geometry.faces[j].b == i) flag_b = true;
                        if (geometry.faces[j].c == i) flag_c = true;
                    }
                }
                if ((flag_a) && (flag_b) && (flag_c)) geometry.faces.splice(j, 1);
            }
            // geometry.computeFaceNormals();
            // geometry.computeFlatVertexNormals();
            geometry.computeVertexNormals();
            console.log("geometry = ", geometry);
            var material = new THREE.MeshPhongMaterial({ color: 0x44aa88, side: THREE.DoubleSide }); // side: THREE.DoubleSide, // отрисовка обратной стороны. Замедляет, и не всегда нужна
            var cube = new THREE.Mesh(geometry, material);
            scene.add(cube);
            renderer.render(scene, camera);

            var wireframe = new THREE.WireframeGeometry(geometry);
            var line = new THREE.LineSegments(wireframe);
            line.material.depthTest = false;
            line.material.opacity = 0.25;
            line.material.transparent = true;
            scene.add(line);

        }
    }
    }

    // console.log("geometry delete transparent= ", geometry);

    // geometry.vertices.push(
    //     new THREE.Vector3(-1, -1, 1),  // 0
    //     new THREE.Vector3(1, -1, 1),  // 1
    //     new THREE.Vector3(-1, 1, 1),  // 2
    //     new THREE.Vector3(1, 1, 1),  // 3
    //     new THREE.Vector3(-1, -1, -1),  // 4
    //     new THREE.Vector3(1, -1, -1),  // 5
    //     new THREE.Vector3(-1, 1, -1),  // 6
    //     new THREE.Vector3(1, 1, -1),  // 7
    // );
    // geometry.faces.push(
    //     // front
    //     new THREE.Face3(0, 3, 2),
    //     new THREE.Face3(0, 1, 3),
    //     // right
    //     new THREE.Face3(1, 7, 3),
    //     new THREE.Face3(1, 5, 7),
    //     // back
    //     new THREE.Face3(5, 6, 7),
    //     new THREE.Face3(5, 4, 6),
    //     // left
    //     new THREE.Face3(4, 2, 6),
    //     new THREE.Face3(4, 0, 2),
    //     // top
    //     new THREE.Face3(2, 7, 6),
    //     new THREE.Face3(2, 3, 7),
    //     // bottom
    //     new THREE.Face3(4, 1, 0),
    //     new THREE.Face3(4, 5, 1),
    // );

    // geometry.computeFaceNormals();


    // настройка материала:
    // const hue = 0.33;
    // const saturation = 1;
    // const luminance = .5;
    // material.color.setHSL(hue, saturation, luminance);
    // console.log('material = ', material);

    // 

    // cube.position.x = 10;
    // cube.position.y = 10;
    // cube.position.z = 50;

    // настройка 

    function get3D() {



    }

    // requestAnimationFrame(render);
    function render() {
        // time *= 0.001;  // конвертировать время в секунды
        // console.log('mousePos3d = ', mousePos3d);
        // cube.rotation.y = - mousePos3d.x / 100;
        // cube.rotation.x = mousePos3d.y / 100;   
        // camera.position.x = mousePos3d.y;
        // camera.position.y = - mousePos3d.x;
        //  camera.position.z = camera.position.z + mousePos3d.x/10;
        // camera.position.set(0, 10, 20);
        // renderer.render(scene, camera);
        // animate();


        requestAnimationFrame(render);
        // console.log("camera.position = ", camera.position);
        controls.update();
        renderer.render(scene, camera);
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

    // get3D();

    function animate() {

        requestAnimationFrame(animate);

        // required if controls.enableDamping or controls.autoRotate are set to true
        controls.update();

        renderer.render(scene, camera);

    }
}
//