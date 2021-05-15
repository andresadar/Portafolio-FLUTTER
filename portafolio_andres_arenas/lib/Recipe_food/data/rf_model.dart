class RFModel {
  final String image, title, author;

  RFModel(this.image, this.title, this.author);
}

class RFModelReviews {
  final String image, title, author, description, nickname;

  RFModelReviews(
      {required this.image,
      required this.title,
      required this.description,
      required this.author,
      required this.nickname});
}

final List<RFModel> rfdata = <RFModel>[
  RFModel(
      'https://dam.cocinafacil.com.mx/wp-content/uploads/2020/04/comida-china-tipica.jpg',
      'Healthy Salad',
      'Julia Nanatsu'),
  RFModel(
      'https://sevilla.abc.es/gurme/wp-content/uploads/sites/24/2012/01/comida-rapida-casera.jpg',
      'Hamburguer Home',
      'by: Julia Nanatsu'),
  RFModel('https://faridnaffah.com/wp-content/uploads/2020/12/blog-3.jpg',
      'Wok Free', 'Julia Nanatsu'),
];

final List<RFModelReviews> rfdataReviews = <RFModelReviews>[
  RFModelReviews(
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2KJuWav8TgdnwP2vp5YhMHtTh386JUVOlBgO3yF_IGgmPFIk81wa7L8IKAlMJY0LVRWk&usqp=CAU',
      title: '"Great Recipes, Thank you"',
      author: 'Eric Anders',
      description:
          'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout',
      nickname: 'erichaff'),
  RFModelReviews(
      image:
          'https://elearningwp.thimpress.com/wp-content/uploads/learn-press-profile/10/8e798becf1500cddf92f7f2ec9be2b8b.jpg',
      title: '"Best mentor, yumi!"',
      author: 'Harvey Harld',
      description:
          'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout',
      nickname: 'harveydl'),
  RFModelReviews(
      image:
          'https://organicthemes.com/demo/profile/files/2018/05/profile-pic.jpg',
      title: '"God jobs!!!"',
      author: 'Michelle Rose',
      description:
          'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout',
      nickname: 'micheller'),
];
