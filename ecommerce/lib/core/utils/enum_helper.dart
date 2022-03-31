part of 'enum.dart';

/// Workaround to achieve enum with value (like in `C#`)
class EnumHelper {
  static int getValue<T>(Map<T, MyEnum> enumMap, T myEnum) {
    if (myEnum == null) {
      return -2;
    }

    return enumMap[myEnum]!.value;
  }

  static String? getDescription<T>(Map<T, MyEnum> enumMap, T myEnum) {
    if (myEnum == null) {
      return '';
    }

    return enumMap[myEnum]!.description;
  }

  /// return first value if not exist
  static T getEnum<T>(Map<T, MyEnum> enumMap, int value) {
    var result =
        enumMap.keys.firstOrDefault((key) => enumMap[key]!.value == value);
    return result ?? enumMap.keys.first;
  }

  /// return first value if not exist
  static T getEnumFromDescription<T>(
      Map<T, MyEnum> enumMap, String description) {
    return enumMap.keys.firstOrDefault(
            (key) => enumMap[key]!.description == description) ??
        enumMap.keys.first;
  }
}

class MyEnum {
  int value;
  String? description;

  MyEnum({
    this.value = 0,
    this.description,
  });
}

class EnumMap {
  static Map<TypeOfDeclaration, MyEnum> typeOfDeclaration = {
    TypeOfDeclaration.calculate: MyEnum(value: 1),
    TypeOfDeclaration.assist: MyEnum(value: 2),
    TypeOfDeclaration.dontDisplay: MyEnum(value: 3),
  };

  static Map<Types, MyEnum> types = {
    Types.value: MyEnum(value: 1),
    Types.quantity: MyEnum(value: 2),
  };
  static Map<PaymentMethod, MyEnum> paymentMethod = {
    PaymentMethod.agentVoucher: MyEnum(value: 0, description: 'Agent Voucher'),
    PaymentMethod.cash: MyEnum(value: 1, description: 'Cash'),
    PaymentMethod.card: MyEnum(value: 2, description: 'Card'),
    PaymentMethod.otherVoucher: MyEnum(value: 3, description: 'Other Voucher'),
    PaymentMethod.prePaidVoucher:
        MyEnum(value: 4, description: 'Prepaid Voucher'),
    PaymentMethod.voucher: MyEnum(value: 5, description: 'Voucher'),
  };
  static Map<PrintTemplateCode, MyEnum> printTemplateCode = {
    PrintTemplateCode.merchantCopy: MyEnum(description: 'Merchant Copy'),
    PrintTemplateCode.merchantCopyChipAndSign:
        MyEnum(description: 'Merchant Copy Chip And Sign'),
    PrintTemplateCode.customerCopy: MyEnum(description: 'Customer Copy'),
    PrintTemplateCode.customerCopyChipAndSign:
        MyEnum(description: 'Customer Copy Chip And Sign'),
    PrintTemplateCode.declarationSummary:
        MyEnum(description: 'Declaration Summary'),
    PrintTemplateCode.ticket: MyEnum(description: 'Ticket'),
    PrintTemplateCode.ticketForm: MyEnum(description: 'Ticket Form'),
    PrintTemplateCode.refund: MyEnum(description: 'Refund'),
    PrintTemplateCode.endOfDay: MyEnum(description: 'EndOfDay'),
  };

  static Map<PosSettingDeclarationTypeValue, MyEnum>
      posSettingDeclarationTypeValue = {
    PosSettingDeclarationTypeValue.blindDeclaration:
        MyEnum(description: 'Blind Declaration'),
    PosSettingDeclarationTypeValue.showCalculatedValues:
        MyEnum(description: 'Show Calculated Values'),
    PosSettingDeclarationTypeValue.noDeclaration:
        MyEnum(description: 'No Declaration'),
  };

  static Map<CashierSessionStatus, MyEnum> cashierSessionStatus = {
    CashierSessionStatus.open: MyEnum(value: 0),
    CashierSessionStatus.close: MyEnum(value: 1),
    CashierSessionStatus.accepted: MyEnum(value: 2),
    CashierSessionStatus.futherInvestigation: MyEnum(value: 3),
    CashierSessionStatus.banked: MyEnum(value: 4),
  };
}
