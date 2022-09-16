class ProfileModel {
  final String id;
  final String title;
  final String name;

  ProfileModel({
    required this.id,
    required this.title,
    required this.name,
  });
}

// ignore: non_constant_identifier_names
List<ProfileModel> DUMMY_PROFILE = [
  ProfileModel(
    id: '1',
    title: 'Name',
    name: 'Dipti Shandilya',
  ),
    ProfileModel(
    id: '2',
    title: 'Mobile Number',
    name: '+910123456789',
  ),
    ProfileModel(
    id: '3',
    title: 'Email id',
    name: 'dipti@gmail.com',
  ),
    ProfileModel(
    id: '4',
    title: 'Gender',
    name: 'Female',
  ),
    ProfileModel(
    id: '5',
    title: 'Date Of Birth',
    name: '01 Aug 1999',
  ),
    ProfileModel(
    id: '6',
    title: 'Blood Group',
    name: 'B+',
  ),
    ProfileModel(
    id: '7',
    title: 'BMI',
    name: '10.6',
  ),
    ProfileModel(
    id: '8',
    title: 'Height',
    name: '163',
  ),
    ProfileModel(
    id: '9',
    title: 'Weight',
    name: '__',
  ),
    ProfileModel(
    id: '10',
    title: 'Emergency Contact',
    name: '108',
  ),
    ProfileModel(
    id: '11',
    title: 'Location',
    name: 'SRI SAI NAGAR',
  ),

];
