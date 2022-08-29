class ServiceUrl {
  static String prefix = 'api';
  static String products = 'products';

  // Created by Haikal
  static String communities = 'communities';
  static String login = 'login';
  static String loginMobile = 'loginMobile';
  static String registerByAnggota = 'registerByAnggota'; //haikal
  static String registerByCmo = 'registerByCMO'; //haikal
  static String referral = 'preRegister'; //haikal
  static String daftarAkun = 'registerAnggotaMobile'; //haikal tgl.17 nov
  static String changeProfileAnggota =
      'changeProfileImgAnggota'; //haikal tgl.17 nov
  static String changeProfileCmo = 'changeProfileCMO'; //haikal tgl.17 nov
  static String categories = 'categories';
  static String forgotPassword = 'forgotPassword';
  static String checkToken = 'checkToken';
  static String changePassword = 'changePassword';
  static String segmentasi = 'segmentasi';
  static String klaster = 'klaster';
  static String listKlaster = 'syncMasterMobile/Cluster';
  static String subKlaster = 'subKlaster';
  static String listSubKlaster = 'syncMasterMobile/SubCluster';
  static String kelompok = 'kelompok';
  static String manageKelompok = 'manageKelompok';
  static String listKelompok = 'syncMasterMobile/Kelompok';
  static String listSegmentasi = 'syncMasterMobile/Segmentasi';
  static String listOutlet = 'syncMasterMobile/Outlet';
  static String listUser = 'syncMasterMobile/User';
  static String listMenuKelompok = 'pagesKelompokBm';
  static String pagesSubClusterBm = 'pagesSubClusterBm';
  static String pagesClusterBm = 'pagesClusterBm';

  static String listAnggotaKelompok = 'listAnggotaByKelompokId';
  static String listStatusPendaftaran = 'listRegisterByCMO';

  static String listUjiKelayakan = 'inquiryRegisterByCMO';
  static String postUK = 'postUK';
  static String manageSubCluster = 'manageSubCluster';
  static String manageCluster = 'manageCluster';
  static String postFaceRecognition = 'postFaceRecognition';

  static String question = 'syncMasterMobile/Question';
  static String questionGroup = 'syncMasterMobile/QuestionGroup';
  static String optionAnswer = 'syncMasterMobile/OptionAnswer';
  static String getKartuHutangParam = 'ar/getArCards';

  // OTHER LINK Created by Dodi Setiawan 24/11/2020
  static String simja = 'depo';
  static String masterDepoType = '$simja/masterDepoType';
  static String testAPI = 'req/depotab';
  static String simjaPencairan = '$simja/pencairan';
  static String konfirmasiPembayaran = '$simja/konfirmasiPembayaran';

  // PROFILE LINK Created by Dodi Setiawan
  static String changePasswordAnggota = 'changeProfilePassAnggota';
  static String unduhSuratKuasa = '$prefix/getPdfFile/TemplateSuratKuasa.pdf';

  // BANK LINK Created by Dodi Setiawan
  static String masterBankAnggota = 'listCustBank';
  static String manageBankAnggota = 'manageCustBank';

  // REFILL LINK Created by Dodi Setiawan
  static String refill = 'refill';
  static String listTopUpSaldo = '$refill/getRefillByCollId';
  static String postTopUpSaldo = '$refill/createData';

  // MASTER LINK Created by Dodi Setiawan
  static String syncMasterMobile = 'syncMasterMobile';
  static String masterBank = '$syncMasterMobile/Bank';
  static String masterRelation = '$syncMasterMobile/Relation';
  static String masterOccup = '$syncMasterMobile/Occup';
  static String masterEducation = '$syncMasterMobile/Education';
  static String masterReligion = '$syncMasterMobile/Religion';
  static String masterDistinctSimpProg = '$syncMasterMobile/DistinctSimpProg';
  static String masterSimpProg = '$syncMasterMobile/SimpProg';
  static String masterSimpTipe = '$syncMasterMobile/SimpTipe';
  static String masterSimpTipeDepo = '$syncMasterMobile/SimpTipeDepo';
  static String masterZipcode = '$syncMasterMobile/Kodepos';
  static String masterKecamatan = '$syncMasterMobile/Kecamatan';
  static String willTagih = '$syncMasterMobile/WillTagih';
  static String masterSimpRelaProg = '$syncMasterMobile/SimpTabProg';
  static String masterSimpTypeTerm = '$syncMasterMobile/getSimpDepoTypeTermV';

  // INFO SIMPANAN LINK Created by Dodi Setiawan
  static String simpok = 'simpok';
  static String infoSimpanan = 'getSimPOKWA';
  static String infoSimPokWa = '$simpok/getSimpSwSpMutationV';

  // BERJANGKA LINK Created by Dodi Setiawan
  static String simjaPengajuan = '$simja/setDataSimpDepo';
  static String simjaPengajuanListVD = '$simja/getDataSimpDepo';
  static String simjaPengajuanKonfirmasi = '$simja/setDataSimpDepo';
  static String simjaPengajuanGambar = '$simja/getPicture';
  static String simjaPencairanListBilyet = '$simja/getSimpDepoBilyetActiveV';
  static String simjaPencairanOpsi = '$simja/getSimpDepoTypeTermV';
  static String simjaPencairanProses = '$simja/setSimpDepoTermStg';
  static String simjaInformasiMutasi = '$simja/getSimpDepoBilyetMutationV';
  static String simjaCekFlagSijaka = '$simja/getKomunitasByCustId';

  // SUKARELA LINK Created by Dodi Setiawan
  static String simla = 'tab';
  static String simlaPengajuan = '$simla/setSimpTabApplStg';
  static String simlaInformasiMutasi = '$simla/getSimpTabBilyetMutationV';
  static String simlaListTabunganAktif = '$simla/getSimpTabBilyetActiveV';
  static String simlaSetorTabungan = '$simla/setSimpTabStrStg';
  static String simlaPengajuanPenarikanTabungan = '$simla/setSimpTabTrkStg';
  static String simlaListPengajuanPenarikan = '$simla/getSimpTabTrkStg';
  static String simlaPenarikanTabungan = '$simla/setSimpTabTrkStg';

  // LIST APPROVAL LINK Created by Dodi Setiawan
  static String listApproval = 'listApproval';
  static String postApproval = 'postApproval';

  // Created by Rafi Lutfansyah
  static String postSignature = 'postSignature';
  static String masterDuedate = 'order/masterDuedate';
  static String masterTopCheck = 'order/masterTopCheck';
  static String masterColl = 'order/masterColl';
  static String masterObject = 'order/masterObject';
  static String masterItem = 'order/masterItem';
  static String masterSupplier = 'order/masterSupplier';
  static String masterSupplierBank = 'order/masterSupplierBank';
  static String getHeaderKomunitas = 'komunitas/getHeaderKomunitas';
  static String listAnggotaByCMO = 'listAnggotaByCMO';
  static String getInfoPlafon = 'order/getInfoPlafon';
  static String simulation = 'order/simulation';
  static String sendDataOrder = 'order/sendDataOrder';
  static String getInquiryOrder = 'order/getInquiryOrder';
  static String getInquiryOrderDetail = 'order/getInquiryOrderDetail';
  static String infoGetPv = 'info/getPv';
  static String infoGetRv = 'info/getRv';
  static String getOrderRefill = 'refill/getOrderRefill';
  static String refillCreateData = 'refill/createData';
  static String listOrderWakalah = 'listOrder/wakalah';
  static String listBAST = 'listBAST';
  static String photoOrder = 'photoOrder';
  static String postOrder = 'postOrder';
  static String getFaceRecognition = 'getFaceRecognition';
  static String listPoByOrderId = 'listPoByOrderId';
  static String postBast = 'postBast';
  static String listActivateContract = 'listActivateContract';
  static String activeContract = 'activeContract';

  // Created by fatur 26/11/2020
  static String collection = 'collection';
  static String collectSubmit = '$collection/collection';
  static String masterCollection = '$collection/getDataTaskByCollId';
  static String getCollectionParam = '$collection/getDataTask';


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

}
