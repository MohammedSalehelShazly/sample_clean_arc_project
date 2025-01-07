// ignore_for_file: constant_identifier_names



class NotifyStrings {
  // topics
  static String clientTopic(String lang) => 'client_$lang';

  // ....

  // titles & bodies
  static const new_client = 'تسجيل جديد';
  static String newClientToAdminBody(String email, String name) =>
      'سجل للتوّ $name كعميل بالإيميل: $email';
  // .
  static const new_order = 'طلب جديد'; // .
  static const update_order = 'تعديل طلب';
  static String updateOrderBody(String id) => 'تم تعديل طلب رقم $id';
  // .
  static const cancel_order = 'إلغاء طلب';
  static String cancelOrderBody(String id) => 'تم إلغاء طلب رقم $id';
  // .
  static const resend_cancel_order = 'إعادة إرسال طلب';
  static String resendCancelOrderBody(String id) =>
      'تم إعادة إرسال طلب ملغى رقم $id';
  // .
  static const new_offer = 'عرض جديد';
  static String newOfferBody(String sellerID, String orderID) =>
      'عرض جديد من $sellerID على طلب رقم $orderID';
  // .
  static const update_offer = 'تعديل عرض';
  static String updateOfferBody(String id, String orderID) =>
      'تم تعديل العرض رقم $id المقدم على طلب رقم $orderID';
  // .
  static const accept_offer = 'قبول عرض';
  static String acceptOfferBodyToSeller(String orderID) =>
      'تم الموافقة من قبل العميل على عرضك المقدم على الطلب رقم $orderID';
  static String acceptOfferBodyToAdmin(String offerID, String orderID) =>
      'تم الموافقة من قبل العميل على العرض المقدم رقم $offerID على الطلب رقم $orderID';
  // .
  static const reject_offer = 'رفض عرض';
  static String rejectOfferBodyToSeller(String orderID) =>
      'نأسف, تم رفض عرضك المقدم على الطلب رقم $orderID من قبل العميل';
  static String rejectOfferBodyToAdmin(String offerID, String orderID) =>
      'تم رفض العرض المقدم رقم $offerID على الطلب رقم $orderID من قبل العميل';
  // .
  static const cancel_offer = 'إلغاء عرض';
  static String cancelOfferBody(String id, String orderID) =>
      'تم إلغاء العرض رقم $id المقدم على طلب رقم $orderID';
  // .
  static String adminMessage(String username) => 'رسالة جديدة من $username';
  // .
  static String updateUserProfileBody(String name) =>
      'قام $name بتعديل معلومات حسابه الشخصي';
  // .
}
