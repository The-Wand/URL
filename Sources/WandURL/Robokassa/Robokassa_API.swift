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

//import WandURL
import Wand

extension Robokassa {

    public
    struct API {

        public
        typealias Model = RobokassaAPI_Model

    }

}

public
protocol RobokassaAPI_Model: Rest.Model {

}

public
extension RobokassaAPI_Model {

    static
    var base: String? {
        "https://auth.robokassa.ru/"
    }

    static
    var headers: [String : String] {
        ["Accept": "application/json",
         "Content-Type": "application/json",
//         "X-Yandex-Weather-Key": Yandex.weatherKey
        ]
    }

}

/// Ask
///
/// paymentParams | .get { (state: RobokassaPayLauncher) in
///
/// }
///
@available(iOS 16, macOS 13, tvOS 16, watchOS 9.0, *)
@discardableResult
@inline(__always)
public
func |(params: PaymentParams,
       get: Ask<RobokassaPayLauncher.Success>.Get) -> Wand {

    let order = params.order

    let outSum = order.orderSum
    let invoiceID = order.invoiceId
    let description = order.description


    return (RobokassaPayLauncher.Success.path + [
        "MerchantLogin": Robokassa.login,
        "OutSum": outSum,
        "InvoiceID": invoiceID,
        "Description": description,
    ]) | get

}

/// Ask
///
/// paymentParams | { (state: RobokassaPayLauncher.Success) in
///
/// }
///
@available(iOS 16, *)
@discardableResult
@inline(__always)
public
func |(params: PaymentParams,
       handler: @escaping (RobokassaPayLauncher.Success)->() ) -> Wand {

    params | .get(handler: handler)

}

#endif
