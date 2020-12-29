
export class TextureSize {
    constructor(_dCont, _image, _objDin, _fun ,_width) {
        let self = this;
        this.type = 'TextureSize';
        this.dContO = _dCont;
        this.image = _image;
        this.objDin = _objDin;
        this.fun = _fun;

        this._width = _width || 200;
        this._height = 32;
        this._wh = 64;
        this._active = false;
        this.lineHeight = 32;
        this.margin = 2;

        this.dCont = new DCont(this.dContO);
        this.dCont.width = this._width - this.margin * 1;
        this.dCont.visible=this._active;

        this.size256But = new DButton(this.dCont, 0, 0, '256', async () => {
            const width = Math.min(2 ** Math.floor(Math.log2(this.image.picWidth)), 256);
            const height = Math.min(2 ** Math.floor(Math.log2(this.image.picHeight)), 256);
            this.setResizedImage(width, height);
        });
        this.size512But = new DButton(this.dCont, 0, 0, '512', async () => {
            const width = Math.min(2 ** Math.floor(Math.log2(this.image.picWidth)), 512);
            const height = Math.min(2 ** Math.floor(Math.log2(this.image.picHeight)), 512);
            this.setResizedImage(width, height);
        });
        this.resizeButton = new DButton(this.dCont, 0, 0, "res", async () => {
            const width = 2 ** Math.floor(Math.log2(this.image.picWidth));
            const height = 2 ** Math.floor(Math.log2(this.image.picHeight));
            this.setResizedImage(width, height);
        });

        this.size256But.width = this.size512But.width = this.resizeButton.width = (this.dCont.width) / 3 ;
        this.size256But.height = this.size512But.height = this.lineHeight / 2 - this.margin * 2;
        this.resizeButton.height = this.lineHeight - this.margin * 2;

        this.size256But.x = 0;
        this.size512But.x = this.size256But.x + this.size256But.width + this.margin;
        this.resizeButton.x = this.size512But.x + this.size512But.width + this.margin;

        this.size256But.visible = this.size512But.visible = this.resizeButton.visible = true;

        this.resLabel = new DLabel(this.dCont, 0, this.margin + 14, "null")
        this.resLabel.text = self.image.picWidth + "x" + self.image.picHeight + "px";
        this.resLabel.fontSize = 12;

        this.colorT = this.resLabel.colorText1;
    }    

    redraw() {
            this.image.link = 'resources/image/pic.png';
            if(this.fun) this.fun(this.image);
    }

    async setResizedImage(width, height) {
        const type = this.image.link.split('.').pop();
        const img = await resizeImage(this.image.link, width, height, type);
        const resp = await uploadFile(img, this.image.link);
        if (resp === 'ok') {
            // this.fun(this.objDin, true, true);
            this.redraw();
        }
    }


    async uploadImage(image) {
        if (image && image.size > 2096000) {
            return;
        }

        var type = image.name.split('.').pop();
        var imageMin = await resizeImageFile(image, 64, 64, type);
        var dest = '../' + aGlaf.resursData + this.objDin.id + '/' + '64.png';
        var resp = await uploadFile(imageMin, dest);
        if (resp !== 'ok') {
            return;
        }


        var type = image.name.split('.').pop();
        var imageMin = await resizeImageFile(image, 100, 100, type);
        var dest = '../' + aGlaf.resursData + this.objDin.id + '/' + '100.png';
        var resp = await uploadFile(imageMin, dest);
        if (resp !== 'ok') {
            return;
        }

        var type = image.name.split('.').pop();
        var imageMin = await resizeImageFile(image, 32, 32, type);
        var dest = '../' + aGlaf.resursData + this.objDin.id + '/' + '32.png';
        var resp = await uploadFile(imageMin, dest);
        if (resp !== 'ok') {
            return;
        }

        var type = image.name.split('.').pop();
        var imageMin = await resizeImageFile(image, 128, 128, type);
        var dest = '../' + aGlaf.resursData + this.objDin.id + '/' + '128.png';
        var resp = await uploadFile(imageMin, dest);
        if (resp !== 'ok') {
            return;
        }

        var type = image.name.split('.').pop();
        var imageMin = await resizeImageFile(image, 256, 256, type);
        var dest = '../' + aGlaf.resursData + this.objDin.id + '/' + '256.png';
        var resp = await uploadFile(imageMin, dest);
        if (resp !== 'ok') {
            return;
        }


        dest = '../' + aGlaf.resursData + this.objDin.id + '/' + 'pic.' + type;
        resp = await uploadFile(image, dest);
        if (resp !== 'ok') {
            return;
        }

        if (this.objDin.type !== type) {
            php.load({
                tip: 'unlink',
                dir: '../' + aGlaf.resursData + this.objDin.id + '/' + 'pic.' + this.objDin.type
            });

            this.objDin.type = type;
            this.fun(this.objDin, true);
            this.redraw();
        } else {
            this.fun(this.objDin, true, true);
            this.redraw();
        }
    }
    set visible(value) {
        if (this._active == value) return;
        this._active = value;
        this.dCont.visible=value
    }
    get visible() { return this._visible; }

    set width(v) {
        if (this._width == v) return;
        this._width = v;
    }
    get width() { return this._width; }

    set height(v) {
        if (this._height == v) return;
        this._height = v;
    }
    get height() { return this._height; }
}


function resizeImageFile(file, width, height, type = 'png') {
    const reader = new FileReader(file);
    reader.readAsDataURL(file);

    return new Promise((res, rej) => {
        reader.onload = event => {
            res(resizeImage(event.target.result, width, height, type, file.name));
        };
    });
}

function resizeImage(src, width, height, type = 'png', fileName = '_') {
    return new Promise((res, rej) => {
        const img = new Image();
        src = 'resources/image/pic.png'
        img.src = src;
        const mime = type === 'png' ? 'image/png' : 'image/jpeg';
        img.onload = () => {
            const elem = document.createElement('canvas');
            elem.width = width;
            elem.height = height;
            const ctx = elem.getContext('2d');
            ctx.drawImage(img, 0, 0, width, height);
            ctx.canvas.toBlob((blob) => {
                const image = new File([blob], fileName);
                res(image);
            }, mime);
        };
    });
}

function uploadFile(file, dest) {
    // let serverURL = php.server + "src/phpBase.php";
    // let serverURL = 'resources/image/'
    let serverURL = 'https://alphakp.ru/media/textures/icons/1.jpg'
    
    let data = new FormData();
    data.append('tip', 'saveFile');
    data.append('file', file);
    data.append('dest', dest);
    return  'ok'
    // return $.ajax({
    //     url: serverURL,
    //     dataType: 'text',
    //     cache: false,
    //     contentType: false,
    //     processData: false,
    //     data: data,
    //     type: 'post'
    // });
}
