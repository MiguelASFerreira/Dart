import 'dart:math';

import 'controllers/bank_controller.dart';
import 'exceptions/bank_controller_exceptions.dart';
import 'models/account.dart';

void testingNullSafety() {
  Account? myAccount = Account(name: "Richart", balance: 200, isAuthenticated: true);
  

  // Simulando uma comunicação externa
  Random rng = Random();
  int randomNumber = rng.nextInt(10);
  if (randomNumber <= 5) {
    myAccount.createdAt = DateTime.now();
  }
  print(myAccount.runtimeType);
  print(myAccount.createdAt);
  // print(myAccount.createdAt.day);
  print(myAccount.createdAt?.day);

  if (myAccount != null) {
    print(myAccount.balance);
    if (myAccount.createdAt != null) {
      print(myAccount.createdAt?.day);
    }
  } else {
    print("Conta Nula");
  }
  print(myAccount.balance);
}

void main() {
  testingNullSafety();

  // Criando o banco
  BankController bankController = BankController();

  // Adicionando contas
 // Account accountTeste = Account(name: "Teste", balance: 200, isAuthenticated: true);
  bankController.addAccount(
      id: "Ricarth",
      account:
          Account(name: "Ricarth Lima", balance: 400, isAuthenticated: true));

  bankController.addAccount(
      id: "Kako",
      account:
          Account(name: "Caio Couto", balance: 600, isAuthenticated: true));

  // Fazendo transferência
  try {
    bool result = bankController.makeTransfer(
        idSender: "Kako", idReceiver: "Ricarth", amount: 50);

    if (result) {
      // Observando resultado
      // print("TRANSAÇÃO CONCLUÍDA COM SUCESSO!");
    }
  } on SenderIdInvalidException catch (e) {
    print(e);
    print("O ID '${e.idSender}' DO REMETENTE NÃO É UM ID VÁLIDO.");
  } on ReceiverIdInvalidException catch (e) {
    print(e);
    print("O NOME '${e.idReceiver}' DO DESTINATÁRIO NÃO É UM ID VÁLIDO.");
  } on SenderNotAuthenticateException catch (e) {
    print(e);
    print("O USUÁRIO REMETENTE DE ID '${e.idSender}' NÃO ESTÁ AUTENTIFICADO.");
  } on SenderBalanceLowerThanAmountException catch (e) {
    print(e);
    print(
        "O USUÁRIO DE ID '${e.idSender}' TENTOU RETIRAR '${e.amount}' SENDO QUE NA SUA CONTA TEM APENAS ${e.senderBalance}.");
  } on Exception {
    print("ALGO DEU ERRADO");
  }
}
