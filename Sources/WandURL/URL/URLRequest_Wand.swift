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
import Foundation.NSURLSession
import Wand

/// Obtain
///
/// let request: URLRequest = nil|
///
@available(visionOS, unavailable)
extension URLRequest: Obtainable {

    @inline(__always)
    public 
    static
    func obtain(by wand: Core?) -> Self {

        guard let wand else {
            fatalError("No context")
        }

        let url:     URL            = wand.get()!
        let method:  Rest.Method    = wand.get() ?? .GET
        let timeout: TimeInterval   = wand.get() ?? method.timeout

        var request                 = URLRequest(url: url, timeoutInterval: timeout)
        request.allHTTPHeaderFields = wand.get() ?? JSON.defaultHeaders
        request.httpBody            = wand.get()
        request.httpMethod          = method.rawValue

        return request
    }

}

#endif
