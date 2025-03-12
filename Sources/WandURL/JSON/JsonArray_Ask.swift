///
/// Copyright © 2020-2024 El Machine 🤖
/// https://el-machine.com/
///
/// Licensed under the Apache License, Version 2.0 (the "License");
/// you may not use this file except in compliance with the License.
/// You may obtain a copy of the License at
///
/// 1) LICENSE file
/// 2) https://apache.org/licenses/LICENSE-2.0
///
/// Unless required by applicable law or agreed to in writing, software
/// distributed under the License is distributed on an "AS IS" BASIS,
/// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
/// See the License for the specific language governing permissions and
/// limitations under the License.
///
/// Created by Alex Kozin
/// 2020 El Machine

#if canImport(Foundation)
import Foundation
import Wand

/// Ask
///
/// "https://api.github.com/gists" | { (array: [Any]) in
///
/// }
///
@available(visionOS, unavailable)
@discardableResult
@inline(__always)
public
func | (path: String, handler: @escaping ([Any])->() ) -> Wand {
    URL(string: path)! | handler
}

/// Ask
///
/// URL(string: "https://api.github.com/gists") | { (array: [Any]) in
///
/// }
///
@available(visionOS, unavailable)
@discardableResult
@inline(__always)
public
func | (url: URL, handler: @escaping ([Any])->() ) -> Wand {

    let wand = Wand()

    //Save ask
    _ = wand.answer(the: .one(handler: handler))

    //Request for a first time

    //Prepare context
    wand.store(url)
    wand.store(JSON.defaultHeaders)

    //Perfom request
    url | .one { (data: Data) in
        do {
            let parsed = try JSONSerialization.jsonObject(with: data)
            wand.add(parsed as! [Any])
        } catch(let e) {
            wand.add(e)
        }
    }

    return wand
}

#endif
