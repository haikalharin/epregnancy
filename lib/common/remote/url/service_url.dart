class ServiceUrl {
  static String prefix = 'api';
  static String products = 'products';

  static String communities = 'communities';

  // user
  static String user = 'user';
  static String userInfo = '$user/info';
  static String userList = '$user/list';
  static String biodata = '$user/biodata';
  static String checkIn = '$user/checkin/';
  static String pointHistory = '$user/points-history';
  static String login = '$auth/login';
  static String loginMobile = 'loginMobile';
  static String register = '$user/register';
  static String updateUser = '$user/update';
  static String updateUserProfile = '$user/profile/update';
  static String updateQuestioner = '$user/update';
  static String forgotPassword = '$user/forgot-password';


  //auth
  static String auth = 'auth';
  static String newLogin = '$auth/login';
  static String refreshToken = '$auth/refresh';


  static String checkUserExist = '$user/check-availability';
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
  static String myBaby = 'my-baby';

  //article
  static String article = 'article';
  static String listArticle = '$article-list';
  static String readArticle = '$article/read';
  static String simpleTip = 'simple-tips';

  //consultation
  static String consultation = 'post';
  static String listConsultation = '$consultation/list';
  static String postConsultation = '$consultation/create';
  static String addComment = '$consultation/';
  static String deletePost = '$consultation/delete';
  static String deletePostComment = '$consultation-comments/';

  //eventSchedule
  static String schedule = 'schedule';
  static String listSchedule = '$schedule/list';
  static String saveSchedule = '$schedule/save';
  static String createScheduleAppointmentMw = '$schedule/create/appointment';
  static String createScheduleMedicineMw = '$schedule/create/medicine';
  static String deleteSchedule = '$schedule/delete';

  //midwife
  static String midwife = 'midwife';
  static String userTotal = '$midwife/user-total';
  static String patientUsers = '$midwife/patient-users';
  static String midwifeUsers = '$midwife/midwife-users';


  //game
  static String game = 'game';
  static String gameList = '$game/list';
  static String gamePlay = '$game/play/';

  //chat
  static String chat = 'chat';
  static String endChat = '$chat/end/';
  static String chatArchive = 'chat-archive';
  static String chatEnd = '$chat/end/';
  static String sendChat = '$chat/send';
  static String latestChat =  '$chat/latest';
  static String chatList =  '$chat/list';
  static String chatArchiveList =  '$chatArchive/latest';
  static String personalChatRoom =  '$chat/personal/';
  static String archivePersonalChatRoom =  '$chatArchive/personal/';
  static String personalChatArchive =  '$chatArchive/personal/';
  static String chatPending = 'chat-pending';
  static String chatPendingResponse = '$chatPending/response';
  static String chatPendingPatient = '$chatPending/page/1';
  static String chatPendingList = '$chatPending/list';
  static String chatPendingListForNakes = '$chatPending/latest/';
  static String chatPendingSend = '$chatPending/send';
  static String lastChat = '$chatPending/last-chat';

  //hospital
  static String hospital = 'hospital';
  static String hospitalVisit = '$hospital/visit/';
  static String hospitalList = '$hospital/list';



}
