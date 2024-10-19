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

//import Wand_URL
import Wand

public
struct PaymentParams: Codable {

    /**
     * Данные о заказе.
     */
    var order = OrderParams()

    /**
     * Данные о покупателе.
     */
    var customer = CustomerParams()

    public
    init(order: OrderParams = OrderParams(), 
         customer: CustomerParams = CustomerParams()) {
        self.order = order
        self.customer = customer
    }

    /**
     * Данные о внешнем виде страницы оплаты.
     */
//    var view: ViewParams = ViewParams()



//    @Suppress("DEPRECATION")
//    private constructor(parcel: Parcel) : this() {
//        parcel.run {
//            setCredentials(
//                merchantLogin = readString() ?: "",
//                password1 = readString() ?: "",
//                password2 = readString() ?: ""
//            )
//            order = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
//                readParcelable(OrderParams::class.java.classLoader, OrderParams::class.java)!!
//            } else {
//                readParcelable(OrderParams::class.java.classLoader)!!
//            }
//            customer = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
//                readParcelable(CustomerParams::class.java.classLoader, CustomerParams::class.java)!!
//            } else {
//                readParcelable(CustomerParams::class.java.classLoader)!!
//            }
//            view = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
//                readParcelable(ViewParams::class.java.classLoader, ViewParams::class.java)!!
//            } else {
//                readParcelable(ViewParams::class.java.classLoader)!!
//            }
//        }
//    }

//    override fun writeToParcel(parcel: Parcel, flags: Int) {
//        parcel.run {
//            writeString(merchantLogin)
//            writeString(password1)
//            writeString(password2)
//            writeParcelable(order, flags)
//            writeParcelable(customer, flags)
//            writeParcelable(view, flags)
//        }
//    }
//
//    override fun describeContents(): Int {
//        return 0
//    }
//
//    @Throws(RoboSdkException::class)
//    override fun checkRequiredFields() {
//        super.checkRequiredFields()
//        kotlin.check(::order.isInitialized) { "Order Params is not set" }
//        order.checkRequiredFields()
//        customer.checkRequiredFields()
//        view.checkRequiredFields()
//    }
//
//    fun setParams(options: PaymentParams.() -> Unit): PaymentParams {
//        return PaymentParams().apply(options)
//    }
//
//    fun orderParams(orderParams: OrderParams.() -> Unit) {
//        this.order = OrderParams().apply(orderParams)
//    }
//
//    fun customerParams(customerParams: CustomerParams.() -> Unit) {
//        this.customer = CustomerParams().apply(customerParams)
//    }
//
//    fun viewParams(viewParams: ViewParams.() -> Unit) {
//        this.view = ViewParams().apply(viewParams)
//    }
//
//    companion object CREATOR : Parcelable.Creator<PaymentParams> {
//
//        override fun createFromParcel(parcel: Parcel): PaymentParams {
//            return PaymentParams(parcel)
//        }
//
//        override fun newArray(size: Int): Array<PaymentParams?> {
//            return arrayOfNulls(size)
//        }
//    }

}

#endif
