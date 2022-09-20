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
  static String loginOtp = '$user/login-otp';
  static String requestOtp = '$user/request-otp';

  //baby
  static String baby = 'user-baby';
  static String saveBaby = '$baby/save';
  static String updateBaby = '$baby/update';
  static String listBaby = '$baby/list';

  //article
static String article = 'article';
static String listArticle = '$article/list';


  //game
  static String game = 'game';
  static String gameList = '$game/list';

  //chat
  static String chat = 'chat';
  static String latestChat =  '$chat/latest';
  static String personalChatRoom =  '$chat/personal/';
  static String chatPending = 'chat-pending';
  static String chatPendingList = '$chatPending/list';
  static String chatPendingSend = '$chatPending/send';

}
