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
protocol Rest_ModelPagedNext: Rest.Paged {

    static
    var nextPage: String? {get set}

}

extension Rest {
    
    public
    typealias PagedNext = Rest_ModelPagedNext
    
}

@available(visionOS, unavailable)
@discardableResult
@inline(__always)
prefix
public
func |<T: Rest.PagedNext> (get: Ask<[T]>.Get) -> Wand {
    nil | get
}

/// Ask
///
/// wand | .get { (array: [Rest.Model]) in
///
/// }
///
@available(visionOS, unavailable)
@inline(__always)
@discardableResult
public
func |<T: Rest.PagedNext> (wand: Wand, get: Ask<[T]>.Get) -> Wand {
    
    let limit: Int  = wand.get() ?? T.limit
    let limitKey    = T.limitKey
    
    let url: URL = T.path| + (limitKey, "\(limit)")
    
    wand.addDefault(url)
    wand.addDefault(T.headers)

    _ = wand.answer(the: get)

    return wand | .one { (data: Data) in
        
        do  { if
                let method: Rest.Method = wand.get(),
                method != .GET,
                let object: T = wand.get()
            {
                wand.add(object)
            }
            else
            {
                let reply = try JSONDecoder().decode([T].self, from: data)
                wand.add(reply)
            }}
            catch(let e)
            {
                wand.add(e)
            }

    }
}

/// Ask Paged with nextURL
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
func |<T: Rest.PagedNext> (wand: Wand, next: Ask<[T]>.Next) -> Wand {

    wand.store(T.nextPage)

    _ = wand.answer(the: next)
    return wand | .one { (data: Data) in

        let model: T = wand.get()!
        wand.add(model)

    }
}

///// Ask Paged with offset
/////
///// wand | .get { (models: [T]) in
/////
///// }
/////
///// wand | .next { (models: [T]) in
/////
///// }
/////
//@available(visionOS, unavailable)
//@inline(__always)
//@discardableResult
//public
//func |<T: Rest.PagedOffset> (wand: Wand, next: Ask<T>.Next) -> Wand {
//
//    
//    var url = URL(string: T.path)
//    url + [
//        "offset": wand.get() as? Int
//    ]
//    
//    
//    appending(queryItems: [URLQueryItem])
//    
//    wand.store(T.nextPage)
//
//    _ = wand.answer(the: next)
//    return wand | .one { (data: Data) in
//
//        let model: T = wand.get()!
//        wand.add(model)
//
//    }
//}

#endif
