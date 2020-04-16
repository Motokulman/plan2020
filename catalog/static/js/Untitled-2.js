// import {Delaunay} from 'delaunay.js';
// Delaunay = require('delaunay.js')

var target = document.querySelector("#main"),
    svg = document.querySelector("svg"),
    ns = svg.namespaceURI,
    defs = document.querySelector("defs"),
    reset = document.querySelector('a'),
    count = 10,
    vertices = [],
    ns = target.namespaceURI,
    { innerWidth, innerHeight } = window,
    copyTextarea = document.querySelector(".js-copytextarea");
innerWidth -= 20;
innerHeight -= 20;

var colors = [
    "hsla(248, 7%, 45%, 0.8)",
    "hsla(148, 7%, 45%, 0.8)",
    "hsla(48, 7%, 45%, 0.8)",
    "hsla(8, 7%, 45%, 0.8)",
    "hsla(8, 7%, 55%, 0.8)",
    "hsla(48, 7%, 55%, 0.8)",
    "hsla(148, 7%, 55%, 0.8)",
    "hsla(248, 7%, 55%, 0.8)",
    "hsla(248, 6%, 65%, 0.8)",
    "hsla(148, 6%, 65%, 0.8)",
    "hsla(48, 6%, 65%, 0.8)",
    "hsla(8, 6%, 65%, 0.8)",
    "hsla(8, 7%, 85%, 0.8)",
    "hsla(48, 7%, 85%, 0.8)",
    "hsla(148, 7%, 85%, 0.8)",
    "hsla(248, 7%, 85%, 0.8)"
];

colors = colors.sort(sortColors);

function make3d() {
    console.log("make3d");
    svg.setAttribute("width", innerWidth);
    svg.setAttribute("height", innerHeight);
    svg.setAttribute("viewBox", `0 0 ${innerWidth} ${innerHeight}`);
    target.innerHTML = "";
    // vertices = getVertices(lines[0]);
    vertices.push([30, 60]);
    vertices.push([70, 90]);
    vertices.push([30, 30]);
    vertices.push([20, 80]);
    vertices.push([70, 0]);
    var triangles = Delaunay.triangulate(vertices);
    console.log("triangles = ", triangles);
    addLines(vertices, triangles, target);
    addFills();
}

function newGrid() {
    var x, y;
    // vertices.push([0,0]);
    // vertices.push([innerWidth,0]);
    // for (var i = 0; i < count; i++) {
    //     x = Math.random() * innerWidth;
    //     y = Math.random() * innerHeight;
    //     vertices.push([x, y]);
    // }

    // vertices.push([30, 60]);
    // vertices.push([70, 90]);
    // vertices.push([30, 30]);
    // vertices.push([20, 80]);
    // vertices.push([70, 0]);
    // vertices.push([innerWidth,innerHeight]);
    // vertices.push([0,innerHeight]);
}

function addLines(vertices, triangles, target) {
    for (var ii = 0; ii < triangles.length; ii += 3) {
        var d = "";
        for (var i = 0; i < 3; i++) {
            const x = vertices[triangles[ii + i]][0],
                y = vertices[triangles[ii + i]][1];
            d += i === 0 ? "M " : "";
            d += x + " " + y;
            d += i === 0 ? " L " : " ";
            circle = createElement("circle", {
                cx: x,
                cy: y,
                r: 10,
                fill: "hsla(0,0%,80%,.4)",
                title: ii
            });
            var c = target.appendChild(circle);
        }

        path = createElement("path", {
            stroke: "black",
            fill: "none",
            strokeWidth: "1px",
            d: d + " z"
        });
        target.appendChild(path);
        setColors();
    }
}

function addLinearOpacity(attrs) {

    var id = 'm' + parseInt(Math.random() * 1000);
    attrs['gradientUnits'] = id;
    attrs['id'] = 'userSpaceOnUse';
    var lg = createElement('linearGradient', attrs);
    var stopAttrs = {
        offset: '0%',
        stopOpacity: '1'
    }
    var s1 = createElement('stop', stopAttrs);
    stopAttrs.offset = '100%';
    var s2 = createElement('stop', stopAttrs);
    lg.appendChild(s2);
    lg.appendChild(s1);
    defs.appendChild(lg);
    return { fill: `url(#)` }
}
function colToNumber(col) {
    var values = col.replace(/[hsla%\(\)]/gi, "").split(",");
    var val = 1;
    values.map(v => (val = val * parseFloat(v)));
    return val;
}
function sortColors(colA, colB) {
    return colToNumber(colA) > colToNumber(colB) ? 1 : -1;
}

function setColors() {
    var minLength = Infinity,
        maxLength = -1;
    var p = Array.from(document.querySelectorAll("path"));
    p.map(p => {
        var l = p.getTotalLength();
        if (l < minLength) {
            minLength = l;
        } else if (l > maxLength) {
            maxLength = l;
        }
    });
    var d = maxLength / colors.length;
    p.map(path => {
        var l = path.getTotalLength();
        var col = colors[parseInt(l / d)];
        if (l > 0) {
            path.setAttribute("fill", col || colors[0]);
        }
        console.log(path.getAttribute('d'))
    });
    //addLinearOpacity()
}

function createElement(name, attrs) {
    var ele = document.createElementNS(ns, name);
    Object.keys(attrs).forEach(attr => {
        ele.setAttribute(attr, attrs[attr]);
    });
    return ele;
}

function addPoint({ clientX, clientY }) {
    vertices.push([clientX - 10, clientY - 10]);
    make3d();
}
reset.addEventListener('click', () => {
    make3d();
});
svg.addEventListener("click", addPoint);
svg.addEventListener("touchend", make3d);

const ce = (tagName, attr = {}) => {
    var ele = document.createElementNS(ns, tagName);
    Object.keys(attr).map(key => ele.setAttribute(key, attr[key]));
    return ele;
};

const addLinearFill = (mm, fill, count) => {
    // addPath({d:`M ${mm[0]} ${mm[1]} L  ${mm[02]} ${mm[3]}`, stroke:'white', fill:'none'});
    var id = `id${count}`;
    var lg = ce("linearGradient", {
        id,
        gradientUnits: 'userSpaceOnUse',
        x1: mm[0],
        y1: mm[1],
        x2: mm[2],
        y2: mm[3]
    });
    const stop0 = ce("stop", {
        offset: "10%",
        "stop-opacity": 1,
        "stop-color": fill
    });
    const stop1 = ce("stop", {
        offset: "80%",
        "stop-opacity": .25,
        "stop-color": fill
    });
    lg.appendChild(stop0);
    lg.appendChild(stop1);
    defs.appendChild(lg);
    return id;
};

const addPath = (attr) => {
    const path = ce("path", attr);
    svg.appendChild(path);
};

const getMinMaxPoints = (points) => {
    var mm = [Infinity, Infinity, -1, -1];
    for (var i = 0; i < points.length - 1; i += 2) {
        var x = points[i],
            y = points[i + 1];
        mm[0] = mm[0] > x ? x : mm[0];
        mm[1] = mm[1] > y ? y : mm[1];
        mm[2] = mm[2] < x ? x : mm[2];
        mm[3] = mm[3] < y ? y : mm[3];
    }
    return mm;
}
const getP1ToP2 = (points) => {
    var mm = [points[0], points[1], points[2], points[3]];
    return mm;
}
const getP1ToP3 = (points) => {
    var mm = [points[0], points[1], points[4], points[5]];
    return mm;
}
const getMidToP2 = (points) => {
    var mx = (points[2] - points[0]) / 2 + parseFloat(points[0]);
    var my = (points[3] - points[1]) / 2 + parseFloat(points[1]);
    var mm = [mx, my, points[4], points[5]];
    return mm;
}

const getP2ToMid = (points) => {
    var mx = (points[2] - points[0]) / 2 + parseFloat(points[0]);
    var my = (points[3] - points[1]) / 2 + parseFloat(points[1]);
    var mm = [points[4], points[5], mx, my];
    return mm;
}

var defs;
function addFills() {
    var paths = Array.from(svg.querySelectorAll("path")),
        count = 0;
    defs = svg.querySelector("defs");
    if (defs === null) {
        defs = svg.appendChild(ce("defs"));
    }
    defs.innerHTML = '';
    paths.map(path => {
        var d = path.getAttribute("d");
        var points = d
            .replace(/[mlz]/gi, "")
            .split(" ")
            .filter(v => v !== "")
            .map(v => parseFloat(v).toFixed(2));
        // mm = [x1,y1,x2,y2]
        var mm = getP2ToMid(points);
        var fill = path.getAttribute("fill");
        var lgId = addLinearFill(mm, fill, count);
        path.setAttribute("fill", `url(#${lgId}`);
        count++;
    });
}


newGrid();
make3d();
