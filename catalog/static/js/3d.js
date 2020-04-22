// канва для 3д
function make3d() {
    var canvas = document.querySelector('#canvas');
    var renderer = new THREE.WebGLRenderer({ canvas });
    renderer.setPixelRatio(window.devicePixelRatio);
    var fov = 75;
    var aspect = canvas.clientWidth / canvas.clientHeight;  // значение для canvas по умолчанию
    var mousePos3d = [{ x: 100, y: 100 }];
    var vert3D = [];
    var vert2D = [];

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

    function getWallLine3dCoords(wall_line) {
        console.log("wall_line = ", wall_line);
        var distance_to_intersection_0 = []; // расстояние от первой точки линии стены до найденного пересечения луча, проведенного через эту стену, до найденного пересечения с ребром ската
        var distance_to_intersection_1 = []; // расстояние от первой точки линии стены до найденного пересечения луча, проведенного через эту стену, до найденного пересечения с ребром ската
        // var distance_to_intersection_1 = []; // впоследствии скат, расстояние до ската которого быдет наименьшим, будет искомым скатом, внктри которого находится данная точка линии стены
        var line3dPoints = []; // массив 3д точек для каждой линии стены
        // var wall_line = lines.find(li => li.id == line_id);
        // определим, внутри каких скатов находится линия стены, определим пересечения с ребрами и их высоту
        var wall_point0 = points.find(point => point.id == wall_line.id0);
        var wall_point1 = points.find(point => point.id == wall_line.id1);
        console.log("wall_point0 = ", wall_point0);
        console.log("wall_point1 = ", wall_point1);
        //найдем коээфициенты уравнения прямой линии стены
        var k_wall = undefined;
        var b_wall = undefined;
        if (wall_point1.x != wall_point0.x) {
            k_wall = (wall_point1.y - wall_point0.y) / (wall_point1.x - wall_point0.x);
            b_wall = (wall_point1.x * wall_point0.y - wall_point0.x * wall_point1.y) / (wall_point1.x - wall_point0.x);
        }
        console.log("k_wall = ", k_wall);
        console.log("b_wall = ", b_wall);
        for (roof_element of elements.values()) {
            if (roof_element.type == "roof") {
                for (lin_id of roof_element.ids.values()) {
                    console.log("**************** new roof line ************");
                    var roof_line = lines.find(l => l.id == lin_id);
                    console.log("roof_line = ", roof_line);
                    var roof_point0 = points.find(point => point.id == roof_line.id0);
                    var roof_point1 = points.find(point => point.id == roof_line.id1);
                    var roof_line_points = [];
                    roof_line_points.push(roof_point0, roof_point1);
                    console.log("roof_point0 = ", roof_point0);
                    console.log("roof_point1 = ", roof_point1);

                    // далее находим пересечения линии стены с данной гранью
                    //найдем коээфициенты уравнения прямой линии кровли
                    var k_roof = undefined;
                    var b_roof = undefined;
                    if (roof_point1.x != roof_point0.x) {
                        // console.log("roof_point1.x = ", roof_point1.x);
                        // console.log("roof_point0.x = ", roof_point0.x);
                        k_roof = (roof_point1.y - roof_point0.y) / (roof_point1.x - roof_point0.x);
                        b_roof = (roof_point1.x * roof_point0.y - roof_point0.x * roof_point1.y) / (roof_point1.x - roof_point0.x);
                    }
                    console.log("k_roof = ", k_roof);
                    console.log("b_roof = ", b_roof);
                    if (((((typeof k_roof == "undefined") && (typeof k_wall == "undefined")) == false)) && (k_roof != k_wall)) { // если они равны, то прямые параллельны  
                        var common_p = [];
                        if (typeof k_wall == "undefined") {// если стена параллельна у
                            common_p.x = wall_point1.x;
                            common_p.y = k_roof * common_p.x + b_roof;
                        } else if (typeof k_roof == "undefined") {// если ребро кровли параллельна у
                            common_p.x = roof_point1.x;
                            common_p.y = k_wall * common_p.x + b_wall;
                        } else {
                            common_p.x = (b_roof - b_wall) / (k_wall - k_roof);
                            common_p.y = k_wall * common_p.x + b_wall;
                        }
                        console.log("common_p = ", common_p);
                        // проверяем, лежит ли найденный х на прямой линии стены
                        if ((typeof common_p.x != "undefined") && straightAffiliation(wall_point0, wall_point1, common_p)) { // возможно придется внестри изменения в функцию для точности
                            // если да, то продолжаем только если найденная общая точка не сопадает ни с первой точкой линии чтены, ни с последней
                            if ((((common_p.x == wall_point0.x) && (common_p.y == wall_point0.y)) == false) && (((common_p.x == wall_point1.x) && (common_p.y == wall_point1.y)) == false)) {
                                // высоту найденной точки определим из пропорции координат точек данной кровельной линии
                                if (roof_point0.x == roof_point1.x) { // то определяем пропорцию по координатам у
                                    common_p.height = roof_point0.height + (roof_point1.height - roof_point0.height) * (Math.abs(common_p.y - roof_point0.y)) / Math.abs((roof_point1.y - roof_point0.y));
                                } else {// то определяем пропорцию по координатам x
                                    common_p.height = roof_point0.height + (roof_point1.height - roof_point0.height) * (Math.abs(common_p.x - roof_point0.x)) / Math.abs((roof_point1.x - roof_point0.x));
                                }
                                line3dPoints.push(common_p);
                            }
                        }
                        // теперь проделаем вычисления необходимые для определения ската, внутри которого находятся крайние точки данной линии стены
                        // определим, лежит ли найденная точка пересечения внутри данной линии ребра ската, то есть луч построенный по отрезку стены, пульнул прсямо в данное ребро, а не только в луч по нему построеннвй
                        // console.log("roof_point0 = ", roof_point0);
                        // console.log("roof_point1 = ", roof_point1);
                        // console.log("common_p = ", common_p);
                        if ((typeof common_p.x != "undefined") && straightAffiliation(roof_point0, roof_point1, common_p)) {
                            console.log("yes= ");
                            // если да, то определим расстояние от каждой точки линии стены до этой точки
                            var interDist = {
                                dist: lengthLine(wall_point0, common_p),
                                roof_id: roof_element.id
                            }
                            distance_to_intersection_0.push(interDist);
                            interDist = {
                                dist: lengthLine(wall_point1, common_p),
                                roof_id: roof_element.id
                            }
                            distance_to_intersection_1.push(interDist);
                        }
                    } //if
                }
            }
        }
        console.log("distance_to_intersection_0 = ", distance_to_intersection_0);
        console.log("distance_to_intersection_1 = ", distance_to_intersection_1);
        var dis_to_intersec = [];
        dis_to_intersec.push(distance_to_intersection_0);
        dis_to_intersec.push(distance_to_intersection_1);
        console.log("dis_to_intersec = ", dis_to_intersec);
        // разберемся с координатами точек над точками линии стены
        var wall_points = [];
        wall_points.push(wall_point0, wall_point1);
        for (i = 0; i < 2; i++) {
            // теперь определим, внутри каких скатов находятся точки данной линии стен
            var min, id_roof_wall_point;

            // var arr = dis_to_intersec[i];
            for (item of dis_to_intersec[i].values()) { }
            if ((typeof min == "undefined") || (item.dist < min)) {
                min = item.dist;
                id_roof_wall_point = item.roof_id;
            }
            console.log("id_roof_wall_point = ", id_roof_wall_point);

            // Зная, в какие скаты попадают наши крайние точки, определяем их высоту
            // сначала, зная id ската, найдем его три любые точки для составления уравнения плоскости
            var flat_points = []; // это массов точек плоскости
            var roof; // это наш скат
            roof = elements.find(el => el.id == id_roof_wall_point);
            // для уравнения плосоксти нам достаточно трех любых точек плоскости. Берем первые три
            var l0 = lines.find(li => li.id == roof.ids[0]);
            var l1 = lines.find(li => li.id == roof.ids[1]);
            var roof_point_0 = points.find(p => p.id == l0.id0);
            var roof_point_1 = points.find(p => p.id == l0.id1);
            var roof_point_2 = points.find(p => p.id == l1.id1);
            var roof_points = [];
            roof_points.push(roof_point_0, roof_point_1, roof_point_2);

            for (k = 0; k < 3; k++) {
                var roof_point_height = roof_points[k].height;
                if (roof_points[k].is_floor_1 == true) roof_point_height = roof_point_height + levels.get('floor_1').height;
                if (roof_points[k].is_floor_2 == true) roof_point_height = roof_point_height + levels.get('floor_2').height;
                if (roof_points[k].is_floor_3 == true) roof_point_height = roof_point_height + levels.get('floor_3').height;
                var flat_point = {
                    x: roof_points[k].x,
                    y: roof_points[k].y,
                    height: roof_point_height
                }
                flat_points.push(flat_point);
            }

            console.log("flat_points  = ", flat_points);
            // определим третью координату наших точек плоскости - высоту

            var a, b, c, f, h, m, o, s;
            a = wall_points[i].x - flat_points[0].x;
            b = wall_points[i].y - flat_points[0].y;
            c = flat_points[1].x - flat_points[0].x;
            f = flat_points[1].y - flat_points[0].y;
            h = flat_points[1].height - flat_points[0].height;
            m = flat_points[2].x - flat_points[0].x;
            o = flat_points[2].y - flat_points[0].y;
            s = flat_points[2].height - flat_points[0].height;

            // a = wall_points[i].x - flat_point1.x;
            // b = wall_points[i].y - flat_point1.y;
            // c = flat_point2.x - flat_point1.x;
            // f = flat_point2.y - flat_point1.y;
            // h = flat_point2.height - flat_point1.height;
            // m = flat_point3.x - flat_point1.x;
            // o = flat_point3.y - flat_point1.y;
            // s = flat_point3.height - flat_point1.height;

            var searched_height = (c * b * s + a * h * o - a * f * s - b * h * m) / (c * o - m * f) + flat_points[0].height;
            var common_p = {
                x: wall_points[i].x,
                y: wall_points[i].y,
                height: searched_height
            };
            line3dPoints.push(common_p);
            common_p = { // добавим еще и нижнюю точку
                x: wall_points[i].x,
                y: wall_points[i].y,
                height: 0
            };
            line3dPoints.push(common_p);
        }

        console.log("line3dPoints = ", line3dPoints);
        return line3dPoints;
    }

    function drawWalls() {
        for (element of elements.values()) { // отрисуем стены
            if (element.type == "wall") {
                for (line_id of element.ids.values()) {
                    console.log("line_id = ", line_id);
                    var wall_line = lines.find(li => li.id == line_id);
                    var vert3D = getWallLine3dCoords(wall_line);
                    console.log("vert3D = ", vert3D);
                    if (vert3D.length >= 3) {
                        vert2D = get2DFrom3DVertices(vert3D);
                        console.log("vert2D = ", vert2D);
                        var geometry = new THREE.Geometry();
                        for (v of vert3D.values()) {
                            var a = new THREE.Vector3(v.x, v.height, v.y);
                            geometry.vertices.push(a);
                        }
                        var triangles = Delaunay.triangulate(vert2D);
                        for (i = 0; i < triangles.length; i = i + 3) {
                            var a = new THREE.Face3(triangles[i], triangles[i + 1], triangles[i + 2]);
                            geometry.faces.push(a);
                        }
                        console.log("geometry = ", geometry);
                        geometry.computeVertexNormals();
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
        }
    }

    drawWalls();


    // for (element of elements.values()) { // отрисуем стены
    //     if (element.type == "wall") {
    //         for (line_id of element.ids.values()) {
    //             var wall_line = lines.find(li => li.id == line_id);
    //             // //console.log("line = ", line);
    //             for (element of elements.values()) {
    //                 if (element.type == "roof") {
    //                     for (lin_id of element.ids.values()) {
    //                         var roof_line = lines.find(l => l.id == lin_id);
    //                         vert3D = getWallVertices(wall_line, roof_line);
    //                         if (vert3D.length >= 3) {
    //                             vert2D = get2DFrom3DVertices(vert3D);

    //                             var geometry = new THREE.Geometry();
    //                             for (v of vert3D.values()) {
    //                                 var a = new THREE.Vector3(v.x, v.y, v.z);
    //                                 geometry.vertices.push(a);
    //                             }
    //                             //console.log("vert2D = ", vert2D);
    //                             var triangles = Delaunay.triangulate(vert2D);
    //                             // //console.log("triangles = ", triangles);
    //                             for (i = 0; i < triangles.length; i = i + 3) {
    //                                 var a = new THREE.Face3(triangles[i], triangles[i + 1], triangles[i + 2]);
    //                                 geometry.faces.push(a);
    //                             }
    //                             // //console.log("geometry = ", geometry);
    //                             // удалим из геометрии стены все имеющиеся ниши под окна, двери и т.д.
    //                             for (j = geometry.faces.length - 1; j >= 0; j--) {
    //                                 var flag_a = false;
    //                                 var flag_b = false;
    //                                 var flag_c = false;
    //                                 var id_a;
    //                                 var id_b;
    //                                 var id_c;
    //                                 for (i = 0; i < vert2D.length; i++) {
    //                                     if (vert3D[i].type == "transparent") {
    //                                         if (geometry.faces[j].a == i) {
    //                                             flag_a = true;
    //                                             id_a = vert3D[i].id;
    //                                         }
    //                                         if (geometry.faces[j].b == i) {
    //                                             flag_b = true;
    //                                             id_b = vert3D[i].id;
    //                                         }
    //                                         if (geometry.faces[j].c == i) {
    //                                             flag_c = true;
    //                                             id_c = vert3D[i].id;
    //                                         }
    //                                     }
    //                                 }
    //                                 if ((flag_a) && (flag_b) && (flag_c) && (id_a == id_b) && (id_b == id_c)) geometry.faces.splice(j, 1);
    //                             }
    //                             // geometry.computeFaceNormals();
    //                             // geometry.computeFlatVertexNormals();
    //                             geometry.computeVertexNormals();
    //                             // //console.log("geometry = ", geometry);
    //                             var material = new THREE.MeshPhongMaterial({ color: 0x44aa88, side: THREE.DoubleSide }); // side: THREE.DoubleSide, // отрисовка обратной стороны. Замедляет, и не всегда нужна
    //                             var cube = new THREE.Mesh(geometry, material);
    //                             scene.add(cube);
    //                             renderer.render(scene, camera);

    //                             var wireframe = new THREE.WireframeGeometry(geometry);
    //                             var line = new THREE.LineSegments(wireframe);
    //                             line.material.depthTest = false;
    //                             line.material.opacity = 0.25;
    //                             line.material.transparent = true;
    //                             scene.add(line);
    //                         }
    //                     }
    //                 }
    //             }




    //         }
    //     }
    //     vert3D = [];
    //     vert2D = [];
    // }

    function drawRoof() {// отрисуем кровлю
        for (element of elements.values()) { // бежим по всем имеющимся элементам
            if (element.type == "roof") { // нас интересуют только крыша

                vert3D = getRoofVertices(element);
                vert2D = get2DFrom3DVerticesRoof(vert3D);
                var geometry = new THREE.Geometry();
                for (v of vert3D.values()) {
                    var a = new THREE.Vector3(v.x, v.y, v.z);
                    geometry.vertices.push(a);
                }
                var triangles = Delaunay.triangulate(vert2D);
                for (i = 0; i < triangles.length; i = i + 3) {
                    var a = new THREE.Face3(triangles[i], triangles[i + 1], triangles[i + 2]);
                    geometry.faces.push(a);
                }
                geometry.computeVertexNormals();
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
    drawRoof();
    // //console.log("geometry delete transparent= ", geometry);

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
    // //console.log('material = ', material);

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
        // //console.log('mousePos3d = ', mousePos3d);
        // cube.rotation.y = - mousePos3d.x / 100;
        // cube.rotation.x = mousePos3d.y / 100;   
        // camera.position.x = mousePos3d.y;
        // camera.position.y = - mousePos3d.x;
        //  camera.position.z = camera.position.z + mousePos3d.x/10;
        // camera.position.set(0, 10, 20);
        // renderer.render(scene, camera);
        // animate();


        requestAnimationFrame(render);
        // //console.log("camera.position = ", camera.position);
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