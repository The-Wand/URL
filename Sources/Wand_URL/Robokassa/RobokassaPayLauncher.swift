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
struct RobokassaPayLauncher {
    



//    sealed
    public
    protocol Result {

    }

    /**
     * Объект успешного возврата из окна оплаты Robokassa.
     * @property invoiceId Номер успешно оплаченного заказа
     * @property resultCode
     * @property stateCode
     */
    public
    struct Success: Result, Robokassa.API.Model {
        
        @inlinable
        public
        static
        var path: String {
            base! + "Merchant/Index.aspx"
        }

        var invoiceId: Int?
//        var resultCode: CheckRequestCode?
//        var stateCode: CheckPayStateCode?
    }

//    data object
    public
    struct Canceled : Result {

    }

    /**
     * Объект возврата с ошибкой из окна оплаты Robokassa.
     * @property error
     * @property resultCode
     * @property stateCode
     * @property desc
     */
    public
    class Error: Result {

//        var error: Throwable?
//        var resultCode: CheckRequestCode?
//        var stateCode: CheckPayStateCode?
//        var desc: String?
//
//        constructor(error: RoboApiException) : this(error, error.response?.requestCode, error.response?.stateCode, error.response?.desc)
    }

    /**
     * Объект для запуска окна оплаты Robokassa.
     * @property paymentParams
     */
    class StartPay: Codable {

        var paymentParams: PaymentParams

    }

//    object Contract : ActivityResultContract<StartPay, Result>() {
//        override fun createIntent(context: Context, input: StartPay) =
//            RobokassaActivity.intent(input.paymentParams, context)
//
//        override fun parseResult(resultCode: Int, intent: Intent?): Result = when (resultCode) {
//            AppCompatActivity.RESULT_OK -> {
//                checkNotNull(intent)
//                Success(
//                    intent.getIntExtra(EXTRA_INVOICE_ID, -1),
//                    intent.serializable(EXTRA_CODE_RESULT),
//                    intent.serializable(EXTRA_CODE_STATE)
//                )
//            }
//
//            AppCompatActivity.RESULT_FIRST_USER -> {
//                val th = intent.getError()
//                val c: CheckRequestCode? = intent?.serializable(EXTRA_CODE_RESULT)
//                val s: CheckPayStateCode? = intent?.serializable(EXTRA_CODE_STATE)
//                val d = intent?.getStringExtra(EXTRA_ERROR_DESC)
//                Error(
//                    th,
//                    c ?: th?.asRoboApiException()?.response?.requestCode,
//                    s ?: th?.asRoboApiException()?.response?.stateCode,
//                    d ?: th?.asRoboApiException()?.response?.desc
//                )
//            }
//
//            else -> Canceled
//        }
//
//    }
//
//    fun Intent?.getError(): Throwable? {
//        return this?.serializable(EXTRA_ERROR)
//    }
//
//    private inline fun <reified T : Serializable> Intent?.serializable(key: String): T? = when {
//        this == null -> null
//        Build.VERSION.SDK_INT >= 33 -> getSerializableExtra(key, T::class.java)
//        else -> @Suppress("DEPRECATION") getSerializableExtra(key) as? T
//    }

}


#endif
