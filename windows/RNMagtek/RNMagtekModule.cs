using ReactNative.Bridge;
using System;
using System.Collections.Generic;
using Windows.ApplicationModel.Core;
using Windows.UI.Core;

namespace Magtek.RNMagtek
{
    /// <summary>
    /// A module that allows JS to share data.
    /// </summary>
    class RNMagtekModule : NativeModuleBase
    {
        /// <summary>
        /// Instantiates the <see cref="RNMagtekModule"/>.
        /// </summary>
        internal RNMagtekModule()
        {

        }

        /// <summary>
        /// The name of the native module.
        /// </summary>
        public override string Name
        {
            get
            {
                return "RNMagtek";
            }
        }
    }
}
