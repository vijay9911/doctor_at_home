import '../constants/imageConstant.dart';

class ServicesModel {
  final String id;
  final String title;
  final String imageUrl;

  const ServicesModel({
    required this.id,
    required this.title,
    required this.imageUrl,
  });
}

const List<ServicesModel> DUMMY_SERVCES = [
  ServicesModel(
    id: '1',
    title: 'Heart',
    imageUrl: Images.HEART,
  ),
  ServicesModel(
    id: '2',
    title: 'Dental',
    imageUrl: Images.DENTAL,
  ),
  ServicesModel(
    id: '3',
    title: 'Brain',
    imageUrl: Images.BRAIN,
  ),
  ServicesModel(
    id: '4',
    title: 'Lungs',
    imageUrl: Images.LUNGS,
  ),
  ServicesModel(
    id: '5',
    title: 'Diabetis',
    imageUrl: Images.DIABETIS,
  ),
  ServicesModel(
    id: '6',
    title: 'Kidney',
    imageUrl: Images.KIDNEY,
  ),
  ServicesModel(
    id: '7',
    title: 'Thyroid',
    imageUrl: Images.THYROID,
  ),
  ServicesModel(
    id: '8',
    title: 'Liver',
    imageUrl: Images.LIVER,
  ),
  ServicesModel(
    id: '9',
    title: 'Joint Pain',
    imageUrl: Images.JOINTPAIN,
  ),
  ServicesModel(
    id: '10',
    title: 'Infection',
    imageUrl: Images.INFECTION,
  ),
  ServicesModel(
    id: '11',
    title: 'Anemia',
    imageUrl: Images.ANEMIA,
  ),
  ServicesModel(
    id: '12',
    title: 'Full Body',
    imageUrl: Images.FULLBODY,
  ),
];
