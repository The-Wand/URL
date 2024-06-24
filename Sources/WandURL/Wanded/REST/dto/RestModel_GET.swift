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
extension Rest_Model {

    @inline(__always)
    public
    static
    func wand<T>(_ wand: Wand, asks ask: Ask<T>) {

        let M = T.self as! Rest.Model.Type
        wand.addDefault(M.path)
        wand.addDefault(M.headers)

        _ = wand.answer(the: ask)

        wand | .one() { (data: Data) in

            do  { if
                    let method: Rest.Method = wand.get(),
                    method != .GET,
                    let object: T = wand.get()
                {
                    wand.add(object)
                }
                else
                {
                    let D = (T.self as! Decodable.Type).self
                    let reply = try JSONDecoder().decode(D, from: data)

                    wand.add(reply as! T)
                }}
                catch(let e)
                {
                    wand.add(e)
                }

        }
    }

}

#endif
