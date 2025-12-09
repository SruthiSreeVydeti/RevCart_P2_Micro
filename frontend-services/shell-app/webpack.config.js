const ModuleFederationPlugin = require("webpack/lib/container/ModuleFederationPlugin");
const mf = require("@angular-architects/module-federation/webpack");
const path = require("path");

const sharedMappings = new mf.SharedMappings();
sharedMappings.register(
  path.join(__dirname, 'tsconfig.json'),
  [/* mapped paths to share */]
);

module.exports = {
  output: {
    uniqueName: "shellApp",
    publicPath: "auto"
  },
  optimization: {
    runtimeChunk: false
  },
  resolve: {
    alias: {
      ...sharedMappings.getAliases(),
    }
  },
  experiments: {
    outputModule: true
  },
  plugins: [
    new ModuleFederationPlugin({
      name: "shell",
      filename: "remoteEntry.js",
      exposes: {},
      remotes: {
        "authMfe": "http://localhost:4201/remoteEntry.js",
        "productMfe": "http://localhost:4202/remoteEntry.js",
        "cartMfe": "http://localhost:4203/remoteEntry.js",
        "ordersMfe": "http://localhost:4204/remoteEntry.js",
        "profileMfe": "http://localhost:4205/remoteEntry.js",
        "deliveryMfe": "http://localhost:4206/remoteEntry.js",
        "notificationsMfe": "http://localhost:4207/remoteEntry.js"
      },
      shared: {
        "@angular/core": { singleton: true, strictVersion: true, requiredVersion: 'auto' },
        "@angular/common": { singleton: true, strictVersion: true, requiredVersion: 'auto' },
        "@angular/common/http": { singleton: true, strictVersion: true, requiredVersion: 'auto' },
        "@angular/router": { singleton: true, strictVersion: true, requiredVersion: 'auto' },
        "rxjs": { singleton: true, strictVersion: true, requiredVersion: 'auto' },
        ...sharedMappings.getDescriptors()
      }
    }),
    sharedMappings.getPlugin()
  ],
};