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
@_exported
import Foundation
@_exported
import Wand

/// Ask
///
/// dto | .patch { (done: DTO) in
///
/// }
///
@available(visionOS, unavailable)
@inline(__always)
@discardableResult
public
func |<T: Rest.Model> (dto: T, patch: Ask<T>.Patch) -> Core {

    let wand = dto.wand
    wand.put(dto| as Data)

    return wand | patch
}

/// Ask
///
/// wand | .put { (done: T) in
///
/// }
///
@available(visionOS, unavailable)
@inline(__always)
@discardableResult
public
func |<T: Rest.Model> (wand: Core, patch: Ask<T>.Patch) -> Core {

    wand.putDefault(T.path| as URL)
    wand.putDefault(T.headers)
    wand.putDefault(Rest.Method.PATCH)

    _ = wand.append(ask: patch)
    return wand | .one { (data: Data) in

        let model: T = wand.get()!
        wand.add(model)
    }
}

#endif
