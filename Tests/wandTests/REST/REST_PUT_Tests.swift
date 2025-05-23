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

import XCTest

import WandURL
import Wand

@available(visionOS, unavailable)
class REST_PUT_Tests: XCTestCase {

    @available(iOS 16.0, *)
    func test_Codable_to_REST_PUT() {
        let e = expectation()

        let id = (1...100).any

        let post = TypicodeAPI.Post(id: id,
                                    userId: .any,
                                    title: .any,
                                    body: nil)
        post | .put { (done: TypicodeAPI.Post) in

            if done.id == id {
                e.fulfill()
            }

        }

        waitForExpectations(timeout: .default * 4)
    }
//
//    @available(iOS 16.0, *)
//    func test_REST_Codable_Delete() {
//        let e = expectation()
//
//        let id = (1...100).any
//
//        let post = JSONplaceholderAPI.Post(id: id,
//                                           userId: .any,
//                                           title: nil,
//                                           body: nil)
//        post | .delete { (done: JSONplaceholderAPI.Post) in
//
//            if done.id == id {
//                e.fulfill()
//            }
//
//        }
//
//        waitForExpectations()
//    }

}
