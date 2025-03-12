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

struct JSON {

    static
    var defaultHeaders = ["Accept": "application/json",
                          "Content-Type": "application/json"]

}

///
/// let t: Codable = data|
///
@inline(__always)
postfix
public
func |<T: Decodable>(data: Data) throws -> T {
    try JSONDecoder().decode(T.self, from: data)
}

///
/// let data: Data = codable|
///
@inline(__always)
postfix
public
func |<T: Codable>(model: T) -> Data {
    try! JSONEncoder().encode(model)
}

#endif
