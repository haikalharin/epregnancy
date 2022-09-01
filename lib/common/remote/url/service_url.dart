class ServiceUrl {
  static String prefix = 'api';
  static String products = 'products';

  // Created by Haikal
  static String communities = 'communities';
  static String login = 'login';
  static String loginMobile = 'loginMobile';
  static String register = 'user/register';

  static String submitCollection = '$collection/sendResult';
  static String submitCollectionSom = '$collection/setPrintResult';
  static String listFlag = '$collection/getLkpParam';
  static String listKlasifikasi = '$collection/getDataMstClassifications';
  static String listAlasan = '$collection/getDataMstDelqReasons';
  static String listPotensi = '$collection/getDataMstPotential';
  static String listDitemui = '$collection/getDataMstWhoMeet';
  static String listRencana = '$collection/getDataMstPlan';

  // masterSummary
  static String summaries = 'summaries';
  static String masterSummary = '$summaries/getFinaTrnCashSum';
  static String getSumSetoranAwalSijakaParam = '$summaries/getFinaTrnCashSum';
  static String insertSubmitCashCount = '$summaries/setCashCount';
  static String setCashCountWithLoc = '$summaries/setCashCountWithLoc';

  // generateRefferalCodeByCMO
  static String referralQrcode = 'generateRefferalCodeByCMO';

  // generateCashCount

  static String cashcount = 'appsys';
  static String listPayCashCount = '$cashcount/getKaryawan';

  // listKasir
  static String kasir = 'kasir';
  static String listKasir = '$kasir/getCustomerContract';
  static String insertSubmitKasirTransaksi = '$kasir/setKasirTran';
  static String getKasirParam = '$kasir/getKasirTran';


  //listGetRvCollection
  static String masterInfoGetRvCollection = 'info';
  static String masterGetRvCollection = 'info/getRv';
  static String postFcmToken = 'notif/setTokenFcm';

  // user
  static String user = 'user';
  static String userInfo = '$user/info';
  static String checkIn = '$user/checkin/';
  static String pointHistory = '$user/points-history';

}
