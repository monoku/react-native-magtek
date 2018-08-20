
import { NativeEventEmitter, NativeModules } from 'react-native';

const { RNMagtek } = NativeModules;

export const RNMagtekEventsEmitter = new NativeEventEmitter(RNMagtek);

export default RNMagtek;
