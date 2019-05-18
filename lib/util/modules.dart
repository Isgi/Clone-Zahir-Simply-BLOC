

import 'package:zahir_online_clone/models/contacts_model.dart';

class Module {
  final String name, endpoint, title;
  final model;

  Module(this.name, this.endpoint, this.title, this.model);


}

final String prefixUrl = '/api/v2';

final Module contacts = Module(
  'contacts',
  '$prefixUrl/contacts',
  'Contact',
  ContactsModel
);

final Module products = Module('products', '$prefixUrl/products', 'Product', ContactsModel);

final Module sales = Module('sales', '$prefixUrl/sales_invoices', 'Sales', ContactsModel);

final Module purchases = Module('purchases', '$prefixUrl/purchases_invoices', 'Purchase', ContactsModel);

final Module receivable_payments = Module('receivable_payments', '$prefixUrl/receivable_payments', 'Receivable Payment', ContactsModel);

final Module payable_payments = Module('payable_payments', '$prefixUrl/payable_payments', 'Payable Payment', ContactsModel);

final Module expenses = Module('expenses', '$prefixUrl/cash_outs', 'Expense', ContactsModel);

final Module profit_loss = Module('profit_loss', '$prefixUrl/report/profit_loss', 'Profit & Loss', ContactsModel);

