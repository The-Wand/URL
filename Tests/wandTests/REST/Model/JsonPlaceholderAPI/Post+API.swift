///
/// Copyright 2020 Alexander Kozin
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
/// Created by Alex Kozin
/// El Machine 🤖

import Foundation.NSData

import WandURL
import Wand

extension TypicodeAPI.Post: TypicodeAPI.Model {

    public
    static
    var path: String {
        base! + "posts"
    }

    /// Put Post
    ///
    /// model | .put { (done: Model) in
    ///
    /// }
    ///
    @discardableResult
    @inline(__always)
    static
    func |(model: Self,
           put: Ask<Self>.Put) -> Core {

        let wand = model.wand

        let path = Self.path + "/\(model.id)"
        wand.put(path| as URL)

        let body: Data = model|
        wand.put(body)

        return wand | put
    }

}

/// Get Post
///
/// 42 | .get { (post: TypicodeAPI.Post) in
///
/// }
///
@discardableResult
@inline(__always)
func |(id: Int,
       get: Ask<TypicodeAPI.Post>.Get) -> Core {

    let wand: Core = nil

    let path = TypicodeAPI.Post.path + "/\(id)"
    wand.put(path)

    return wand | get
}

/// Delete Post
///
/// model | .delete { (done: Model) in
///
/// }
///
@discardableResult
@inline(__always)
func |(id: Int,
       delete: Ask<TypicodeAPI.Post>.Delete) -> Core {

    let wand: Core = nil

    let path = TypicodeAPI.Post.path + "/\(id)"
    wand.put(path)

    return wand | delete
}
