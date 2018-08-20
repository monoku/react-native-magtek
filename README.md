
# react-native-magtek

## Getting started

`$ npm install @monoku/react-native-magtek --save`

### Mostly automatic installation

`$ react-native link @monoku/react-native-magtek`

### Manual installation

#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `@monoku/react-native-magtek` and add `RNMagtek.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNMagtek.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.reactlibrary.RNMagtekPackage;` to the imports at the top of the file
  - Add `new RNMagtekPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-magtek'
  	project(':react-native-magtek').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-magtek/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-magtek')
  	```

#### Windows
[Read it! :D](https://github.com/ReactWindows/react-native)

1. In Visual Studio add the `RNMagtek.sln` in `node_modules/react-native-magtek/windows/RNMagtek.sln` folder to their solution, reference from their app.
2. Open up your `MainPage.cs` app
  - Add `using Magtek.RNMagtek;` to the usings at the top of the file
  - Add `new RNMagtekPackage()` to the `List<IReactPackage>` returned by the `Packages` method


## Usage
```javascript
import RNMagtek, { RNMagtekEventsEmitter } from '@monoku/react-native-magtek';

RNMagtek.connect((data) => {
  const { isDeviceConnected, isDeviceOpened } = data;
  if (isDeviceConnected && isDeviceOpened) {
    console.log("Card reader is connected and ready!!!");
  }
});

RNMagtekEventsEmitter.addListener('devConnectionNotification', (data) => {
  const { isDeviceConnected } = data;
  if (!isDeviceConnected) {
    console.log("Opps! Device have been disconnected.");
  }
});
```
