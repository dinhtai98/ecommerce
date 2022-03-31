import 'package:ecommerce/core/utils/list_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'enum_helper.dart';


enum BottomDialogType {
  warning,
  info,
  success,
  error,
}

enum Types {
  @JsonValue(1)
  value,
  @JsonValue(2)
  quantity,
}

enum TypeOfDeclaration {
  @JsonValue(1)
  calculate,
  @JsonValue(2)
  assist,
  @JsonValue(3)
  dontDisplay,
}
enum SyncStatus {
  success, // 3 case later is fail
  retry,
  continueSync,
  canNext,
  retryOnly,
}

enum RefundStatus {
  @JsonValue(0)
  none,
  @JsonValue(1)
  partial,
  @JsonValue(2)
  full,
  @JsonValue(3)
  standard,
}

enum PaymentMethod {
  agentVoucher,
  cash,
  card,
  otherVoucher,
  prePaidVoucher,
  voucher,
}

enum NavigationBarValue {
  home,
  validate,
  transactions,
  more,
}
enum PosSettingDeclarationTypeValue {
  blindDeclaration,
  showCalculatedValues,
  noDeclaration,
}

enum CashierSessionStatus {
  @JsonValue(0)
  open,
  @JsonValue(1)
  close,
  @JsonValue(2)
  accepted,
  @JsonValue(3)
  futherInvestigation,
  @JsonValue(4)
  banked,
}

enum TenderTypeEnum { cash, card, discount, voucher, other }


enum PrintTemplateCode {
  merchantCopy,
  merchantCopyChipAndSign,
  customerCopy,
  customerCopyChipAndSign,
  declarationSummary,
  ticket,
  ticketForm,
  refund,
  endOfDay,
}

