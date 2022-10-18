class ServiceUrl {
  static String prefix = 'api';
  static String products = 'products';

  static String communities = 'communities';

  // user
  static String user = 'user';
  static String userInfo = '$user/info';
  static String checkIn = '$user/checkin/';
  static String pointHistory = '$user/points-history';
  static String login = '$user/login';
  static String loginMobile = 'loginMobile';
  static String register = '$user/register';
  static String updateUser = '$user/update';
  static String updateQuestioner = '$user/update';
  static String forgotPassword = '$user/forgot-password';

  static String checkUserExist = '$user/check-availability/username';
  static String changePassword = '$user/change-password';

  //otp
  static String otp = 'otp';
  static String requestOtp = '$otp/request';
  static String verifyOtp = '$otp/verify';


  //baby
  static String baby = 'user-baby';
  static String saveBaby = '$baby/save';
  static String updateBaby = '$baby/update';
  static String listBaby = '$baby/list';

  //article
  static String article = 'article';
  static String listArticle = '$article/list';
  static String readArticle = '$article/read';

  //consultation
  static String consultation = 'post';
  static String listConsultation = '$consultation/list';
  static String postConsultation = '$consultation/create';

  //eventSchedule
  static String schedule = 'schedule';
  static String listSchedule = '$schedule/list';
  static String saveSchedule = '$schedule/save';
  static String deleteSchedule = '$schedule/delete';

  //game
  static String game = 'game';
  static String gameList = '$game/list';

  //chat
  static String chat = 'chat';
  static String endChat = '$chat/end/';
  static String chatArchive = 'chat-archive';
  static String chatEnd = '$chat/end/';
  static String sendChat = '$chat/send';
  static String latestChat =  '$chat/latest';
  static String chatList =  '$chat/list';
  static String chatArchiveList =  '$chatArchive/list';
  static String personalChatRoom =  '$chat/personal/';
  static String personalChatArchive =  '$chatArchive/personal/';
  static String chatPending = 'chat-pending';
  static String chatPendingResponse = '$chatPending/response';
  static String chatPendingPatient = '$chatPending/page/1';
  static String chatPendingList = '$chatPending/list';
  static String chatPendingListForNakes = '$chatPending/latest/';
  static String chatPendingSend = '$chatPending/send';

  //hospital
  static String hospital = 'hospital';
  static String hospitalVisit = '$hospital/visit/';
  static String hospitalList = '$hospital/list';



}
