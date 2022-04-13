import 'package:asia_uz/cubit/profile_cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:asia_uz/core/imports/imports.dart';
import '../../core/components/view/my_app_bar.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _dataBirthController = TextEditingController();
  final TextEditingController _floorController = TextEditingController();
  final TextEditingController _seminalPositionController =
      TextEditingController();
  final TextEditingController _employmentController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _homePhoneNumberController =
      TextEditingController();
  final TextEditingController _homeSecondPhoneNumberController =
      TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _notificationController = TextEditingController();
  final TextEditingController _languageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
      create: (context) => ProfileCubit(
        _formKey,
        _nameController,
        _surnameController,
        _dataBirthController,
        _floorController,
        _seminalPositionController,
        _employmentController,
        _phoneNumberController,
        _homePhoneNumberController,
        _homeSecondPhoneNumberController,
        _emailController,
        _notificationController,
        _languageController,
      ),
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {},
        builder: (context, state) {
          var _context = context.read<ProfileCubit>();
          if (state is ProfileInitial) {
            return buildScaffold(context, state, _context);
          } else {
            final error = state as ProfileError;
            return Center(
              child: Text(error.erroeMessange),
            );
          }
        },
      ),
    );
  }

  back(context) {
    Navigator.pop(context);
  }

  buildScaffold(
      BuildContext context, ProfileState state, ProfileCubit _context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: MyAppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: AppColors.whiteColor,
        ),
        text: 'Профиль',
        action: SvgPicture.asset(SvgIcons.avatar),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getWidth(23.0),
              vertical: getHeight(6.0),
            ),
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    hintText: 'Имя*',
                    labelText: 'Имя*',
                  ),
                  validator: (v) => v!.isEmpty ? 'Ism kiritilmadi' : null,
                ),
                SizedBox(height: getHeight(4.0)),
                TextFormField(
                  controller: _surnameController,
                  decoration: const InputDecoration(
                    hintText: 'Фамилия*',
                    labelText: 'Фамилия*',
                  ),
                  validator: (v) => v!.isEmpty ? 'Familiya kiritilmadi' : null,
                ),
                SizedBox(height: getHeight(4.0)),
                TextFormField(
                  controller: _dataBirthController,
                  decoration: const InputDecoration(
                    hintText: 'Дата рождения*',
                    labelText: 'Дата рождения*',
                    suffixIcon: Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.black,
                    ),
                  ),
                  validator: (v) => v!.isEmpty ? 'Sana kiritilmadi' : null,
                ),
                SizedBox(height: getHeight(4.0)),
                TextFormField(
                  controller: _floorController,
                  decoration: const InputDecoration(
                    hintText: 'Пол*',
                    labelText: 'Пол*',
                    suffixIcon: Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.black,
                    ),
                  ),
                  validator: (v) => v!.isEmpty ? 'Jins kiritilmadi' : null,
                ),
                SizedBox(height: getHeight(4.0)),
                TextFormField(
                  controller: _seminalPositionController,
                  decoration: const InputDecoration(
                    hintText: 'Семейное положение*',
                    labelText: 'Семейное положение*',
                    suffixIcon: Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.black,
                    ),
                  ),
                  validator: (v) =>
                      v!.isEmpty ? 'Oilaviy sharoit kiritilmadi' : null,
                ),
                SizedBox(height: getHeight(4.0)),
                TextFormField(
                  controller: _employmentController,
                  decoration: const InputDecoration(
                    hintText: 'Занятость*',
                    labelText: 'Занятость*',
                    suffixIcon: Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.black,
                    ),
                  ),
                  validator: (v) => v!.isEmpty ? 'Kiritilmadi' : null,
                ),
                SizedBox(height: getHeight(4.0)),
                TextFormField(
                  controller: _phoneNumberController,
                  decoration: const InputDecoration(
                    hintText: 'Мобильный телефон*',
                    labelText: 'Мобильный телефон*',
                    suffixIcon: Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.black,
                    ),
                  ),
                  validator: (v) =>
                      v!.isEmpty ? 'Telefon raqam kiritilmadi' : null,
                ),
                SizedBox(height: getHeight(4.0)),
                TextFormField(
                  controller: _homePhoneNumberController,
                  decoration: const InputDecoration(
                    hintText: 'Домашний телефон*',
                    labelText: 'Домашний телефон*',
                    suffixIcon: Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.black,
                    ),
                  ),
                  validator: (v) => v!.isEmpty ? 'Uy raqami kiritilmadi' : null,
                ),
                SizedBox(height: getHeight(4.0)),
                TextFormField(
                  controller: _homeSecondPhoneNumberController,
                  decoration: const InputDecoration(
                    hintText: 'Дополнительный телефон*',
                    labelText: 'Дополнительный телефон*',
                    suffixIcon: Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.black,
                    ),
                  ),
                  validator: (v) =>
                      v!.isEmpty ? 'Qoshimcha raqam kiritilmadi' : null,
                ),
                SizedBox(height: getHeight(4.0)),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    hintText: 'E-mail*',
                    labelText: 'E-mail*',
                    suffixIcon: Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.black,
                    ),
                  ),
                  validator: (v) => v!.isEmpty ? 'Email kiritilmadi' : null,
                ),
                SizedBox(height: getHeight(4.0)),
                TextFormField(
                  controller: _notificationController,
                  decoration: const InputDecoration(
                    hintText: 'Способ получения уведомлений*',
                    labelText: 'Способ получения уведомлений*',
                    suffixIcon: Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.black,
                    ),
                  ),
                  validator: (v) => v!.isEmpty ? 'Kiritilmadi' : null,
                ),
                SizedBox(height: getHeight(4.0)),
                TextFormField(
                  controller: _languageController,
                  decoration: const InputDecoration(
                    hintText: 'Язык уведомлений*',
                    labelText: 'Язык уведомлений*',
                    suffixIcon: Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.black,
                    ),
                  ),
                  validator: (v) => v!.isEmpty ? 'Kiritilmadi' : null,
                ),
                SizedBox(height: getHeight(25.0)),
                MyElevatedButton(
                  text: 'Сохранить',
                  onPressed: () {
                    _context.validateState();
                    _context.clear();
                  },
                  height: 50.0,
                  // width: 161.0,
                  primaryColor: AppColors.transparentColor,
                  sideColor: AppColors.orangeColor,
                  radius: 15.0,
                  sideWidth: 2.0,
                ),
                SizedBox(height: getHeight(20.0)),
                SizedBox(
                  height: getHeight(70.0),
                  width: getWidth(334.0),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: getWidth(13.0),
                      ),
                      children: [
                        TextSpan(
                          text: ("Нажимая “Продолжить” вы соглашаетесь с\n"),
                          style: TextStyle(
                            color: AppColors.teal,
                            fontSize: getWidth(13.0),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: ("условиями "),
                          style: TextStyle(
                            color: AppColors.teal,
                            fontSize: getWidth(13.0),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: ("Обработки персональных "),
                          style: TextStyle(
                            color: AppColors.onPressColor,
                            fontSize: getWidth(13.0),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: ("данных,\n"),
                          style: TextStyle(
                            color: AppColors.teal,
                            fontSize: getWidth(13.0),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: ("Программой лояльности и Публичной аферты"),
                          style: TextStyle(
                            color: AppColors.onPressColor,
                            fontSize: getWidth(13.0),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: getHeight(15.0)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
