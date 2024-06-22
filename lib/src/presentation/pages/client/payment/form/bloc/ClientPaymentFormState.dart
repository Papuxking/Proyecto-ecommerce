
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ClientPaymentFormState extends Equatable {

  final String cardNumber;
  final String expireDate;
  final String cardHolderName;
  final String cvvCode;
  final String? identificationType;
  final String identificationNumber;
  final bool isCvvFocused;
  final GlobalKey<FormState>? formKey;
  final Resource? response;
  final double totalToPay;

  const ClientPaymentFormState({
    this.cardNumber = '',
    this.expireDate = '',
    this.cardHolderName = '',
    this.cvvCode = '',
    this.isCvvFocused = false,
    this.formKey,
    this.identificationType,
    this.identificationNumber = '',
    this.response,
    this.totalToPay = 0
  });



   

  @override
  // TODO: implement props
  List<Object?> get props => [cardNumber, expireDate, cardHolderName, cvvCode, isCvvFocused, identificationType, identificationNumber, response, totalToPay];

}