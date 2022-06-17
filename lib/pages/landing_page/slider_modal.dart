class SliderModal {
  late String title;
  late String image;
  late String description;

  void setImage(String getImage) {
    image = getImage;
  }
  String getImage() {
    return image;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }
  String getTitle() {
    return title;
  }

  void setDescription(String getDescription) {
    description = getDescription;
  }
  String getDescription() {
    return description;
  }

  List<SliderModal> getAllSliders() {
    List<SliderModal> slides = [];
    SliderModal sliderModal = SliderModal();
    sliderModal.setImage('assets/slider1.png');
    sliderModal.setTitle('Konsultasi dengan Bidan dimana saja');
    sliderModal.setDescription('Gunakan fiture obrolan di aplikasi untuk konsultasi dengan Bidan');
    slides.add(sliderModal);

    sliderModal = SliderModal();
    sliderModal.setImage('assets/slider2.png');
    sliderModal.setTitle('Lengkapi pengetahuan tentang kehamilan');
    sliderModal.setDescription('Termukan berbagai konten edukatif yang dapat membantu Anda mempersiapkan kehamilan');
    slides.add(sliderModal);

    sliderModal = SliderModal();
    sliderModal.setImage('assets/slider3.png');
    sliderModal.setTitle('Informasi Acara Posyandu');
    sliderModal.setDescription('Aplikasi akan menampilkan acara yang diselenggarakan di Posyandu Anda');
    slides.add(sliderModal);

    sliderModal = new SliderModal();

    return slides;
  }
}