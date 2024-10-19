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

@available(visionOS, unavailable)
public
protocol Rest_ModelPaged: Rest.Model {

    static
    var nextPage: String {get}

}

/// Ask
///
/// wand | .get { (models: [T]) in
///
/// }
///
/// wand | .next { (models: [T]) in
///
/// }
///
@available(visionOS, unavailable)
@inline(__always)
@discardableResult
public
func |<T: Rest_ModelPaged> (wand: Wand, next: Ask<T>.Next) -> Wand {

    wand.store(T.nextPage)

    _ = wand.answer(the: next)
    return wand | .one { (data: Data) in

        let model: T = wand.get()!
        wand.add(model)

    }
}

#endif
