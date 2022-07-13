import 'package:stripe_payment/stripe_payment.dart';

class PaymentService {
  final int amount;
  final String url;

  PaymentService({
    this.amount = 10,
    this.url = "",
  });
  static init() {
    StripePayment.setOptions(StripeOptions(
      publishableKey:
          "pk_test_51Kx1eMSE7oFaVtwcOinXgScS94FaU1NJEsoqyrwsJTCuFM4s1Vlkr5cRoutw0L7CbKPDXcdo31QflWAVmSiZWalp00ubUb3438",
      androidPayMode: "test",
      merchantId: "test",
    ));
  }

  Future<PaymentMethod?> createPaymentMethod() async {
    print("The transaction amount to be charged is:$amount");
    PaymentMethod paymentMethod =
        await StripePayment.paymentRequestWithCardForm(
      CardFormPaymentRequest(),
    );
    return paymentMethod;
  }

  Future<void> processPayment(PaymentMethod paymentMethod) async {}
}
