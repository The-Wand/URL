///
/// Copyright 2020 Aleksandr Kozin
///
/// Licensed under the Apache License, Version 2.0 (the "License");
/// you may not use this file except in compliance with the License.
/// You may obtain a copy of the License at
///
///     http://www.apache.org/licenses/LICENSE-2.0
///
/// Unless required by applicable law or agreed to in writing, software
/// distributed under the License is distributed on an "AS IS" BASIS,
/// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
/// See the License for the specific language governing permissions and
/// limitations under the License.
///
/// Created by Alek Kozin
/// El Machine 🤖

#if canImport(Foundation)
@_exported
import Foundation

import Wand

/// Ask
///
/// "https://api.github.com/gists" | { (data: Data) in
///
/// }
///
@available(visionOS, unavailable)
extension Data: Asking, Wanded {

    @inline(__always)
    public
    static
    func ask<C, T>(with context: C, ask: Ask<T>) -> Core {

//        let request: URLRequest = wand.obtain()
//        ask.key = request.hashValue|

        let wand = Wand.Core.to(context)
        
        //Save ask
        guard wand.append(ask: ask) else {
            return wand
        }

        //Request for a first time

        //Make request
        let task = URLSessionDataTask.obtain(by: wand)
        task.resume()
        
        return wand
    }

}

#endif
