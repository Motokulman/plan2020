

const path = require('path');
const webpack = require('webpack');
const bodyParser = require('body-parser');
 let conf = {
  	entry: './src/pm/index.js',
  	output: {
		path: path.resolve(__dirname, 'src/pm/'),
		filename: 'pm.min.js',
		publicPath: 'src/pm/',
		hotUpdateChunkFilename: 'hot-update/hot-update.js',
		hotUpdateMainFilename: 'hot-update/hot-update.json',
	},
  	devServer: {       
        overlay: true,        
    },  
	module: {
		rules: [
	      {
	        test: /\.js$/,
	        exclude: /node_modules/,
	        use: {
	          loader: "babel-loader"
	        }
	      }
	    ]
	},
	plugins: [
		new webpack.HotModuleReplacementPlugin()
    ],
	devtool: 'eval-sourcemap'
};

module.exports = conf;

module.exports = (_env, _options) => {

	let production = (_options.mode === 'production');

	conf.devtool = production ? false : 'eval-sourcemap';
	conf.watch = production ? false : true;

	return conf;
}