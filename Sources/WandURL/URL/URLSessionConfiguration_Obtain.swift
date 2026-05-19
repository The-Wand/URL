///
/// Copyright 2020 Aleksander Kozin
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
/// Created by Aleksander Kozin
/// The Wand

#if canImport(Foundation)
@_exported
import Foundation.NSURLSession
@_exported
import Wand

/// Obtain
///
/// let
///
@available(visionOS, unavailable)
extension URLSessionConfiguration: @retroactive Obtainable {

    @inline(__always)
    public
    static
    func obtain<C>(with scope: C?, by wand: Core?) -> Self {
        if let backgroundIdentifier = scope as? String ?? wand?.get() {
            Self.background(withIdentifier: backgroundIdentifier) as! Self
        } else {
            Self.default as! Self
        }
    }

}

#endif

