import 'package:zahir_online_clone/screens/landing/landing.dart';
import 'package:zahir_online_clone/screens/dashboard/dashboard.dart';
import 'package:zahir_online_clone/screens/login/login.dart';
import 'package:zahir_online_clone/screens/contacts/contacts.dart';
import 'package:zahir_online_clone/screens/contacts/contacts_create.dart';
import 'package:zahir_online_clone/screens/products/products.dart';
import 'package:zahir_online_clone/screens/products/products_create.dart';
import 'package:zahir_online_clone/screens/expense/expense.dart';
import 'package:zahir_online_clone/screens/expense/expense_create.dart';
import 'package:zahir_online_clone/screens/payable_payment/payable_payment.dart';
import 'package:zahir_online_clone/screens/payable_payment/payable_payment_create.dart';
import 'package:zahir_online_clone/screens/purchase/purchase.dart';
import 'package:zahir_online_clone/screens/purchase/purchase_create.dart';
import 'package:zahir_online_clone/screens/receivable_payment/receivable_payment.dart';
import 'package:zahir_online_clone/screens/receivable_payment/receivable_payment_create.dart';
import 'package:zahir_online_clone/screens/sales/sales.dart';
import 'package:zahir_online_clone/screens/sales/sales_create.dart';
import 'package:zahir_online_clone/screens/profit_loss/profit_loss.dart';
import 'package:zahir_online_clone/screens/more/more.dart';

var routes = {
  '/': (context) => Landing(),
  '/dashboard': (context) => Dashboard(),
  '/login': (context) => Login(),
  '/contacts': (context) => Contacts(),
  '/contacts_create': (context) => ContactsCreate(),
  '/products': (context) => Products(),
  '/products_create': (context) => ProductsCreate(),
  '/expense': (context) => Expense(),
  '/expense_create': (context) => ExpenseCreate(),
  '/payable_payment': (context) => PayablePayment(),
  '/payable_payment_create': (context) => PayablePaymentCreate(),
  '/purchase': (context) => Purchase(),
  '/purchase_create': (context) => PurchaseCreate(),
  '/receivable_payment': (context) => ReceivablePayment(),
  '/receivable_payment_create': (context) => ReceivablePaymentCreate(),
  '/sales': (context) => Sales(),
  '/sales_create': (context) => SalesCreate(),
  '/profit_loss': (context) => ProfitLoss(),
  '/more': (context) => More()
};