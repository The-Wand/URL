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

#if canImport(Foundation)
import Foundation.NSURL

@available(iOS 16, macOS 13, tvOS 16, watchOS 9.0, *)
@inline(__always)
public
func + (url: URL, q: URLQueryItem) -> URL {
    url.appending(queryItems: [q])
}

@available(iOS 16, macOS 13, tvOS 16, watchOS 9.0, *) //TODO: Removvvee C-P
func + (path: String, items: [String: Any?]) -> String? {

    let url = URL(string: path)

    return url?.appending(queryItems: items.map {
        URLQueryItem(name: $0.key, value: String(describing: $0.value))
    }).absoluteString

}

@available(iOS 16, macOS 13, tvOS 16, watchOS 9.0, *)
func + (url: URL, items: [String: Any?]) -> URL {

    url.appending(queryItems: items.map {
        URLQueryItem(name: $0.key, value: String(describing: $0.value))
    })

}

#endif
