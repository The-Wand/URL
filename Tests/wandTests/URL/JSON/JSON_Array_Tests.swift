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

#if canImport(Foundation)
import Foundation
import XCTest

import Wand_URL
import Wand

class JSON_Array_Tests: XCTestCase {

    func test_Path_to_Array() {
        let e = expectation()

        let path = "https://api.github.com/repositories"
        path | { (array: [Any]) in

            if !array.isEmpty {
                e.fulfill()
            }

        }

        waitForExpectations()
    }

    @available(iOS 16, macOS 13, tvOS 16, watchOS 9, *)
    func test_URL_to_Array() {
        let e = expectation()

        let q = URLQueryItem(name: "q", value: "swift")

        var url = URL(string: "https://api.github.com/repositories")!
        url.append(queryItems: [q])

        url | { (array: [Any]) in

            if !array.isEmpty {
                e.fulfill()
            }

        }

        waitForExpectations()
    }

}

#endif
