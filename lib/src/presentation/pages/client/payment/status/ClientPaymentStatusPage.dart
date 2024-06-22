import 'package:ecommerce_flutter/src/domain/models/MercadoPagoPaymentResponse.dart';
import 'package:flutter/material.dart';

class ClientPaymentStatusPage extends StatefulWidget {
  const ClientPaymentStatusPage({super.key});

  @override
  State<ClientPaymentStatusPage> createState() => _ClientPaymentStatusPageState();
}

class _ClientPaymentStatusPageState extends State<ClientPaymentStatusPage> {

  MercadoPagoPaymentResponse? paymentResponse;

  @override
  Widget build(BuildContext context) {
    paymentResponse = ModalRoute.of(context)?.settings.arguments as MercadoPagoPaymentResponse;
    return Scaffold(
      body: Center(child: Text("ClientPaymentStatusPage"),),
    );
  }
}