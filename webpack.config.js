module.exports = {
  entry: __dirname + "/frontend/js/app.js",
  output: {
    path: __dirname + "/priv/static/js",
    filename: "app.js"
  },
  module: {
    loaders: [{
      test: /\.js$/,
      exclude: /node_modules/,
      loader: "babel-loader",
      query: {
        presets: ["es2015", "react"]
      }
    }]
  },
  resolve: {
    modules: [ "node_modules", __dirname + "/web/static/js" ]
  }
};
