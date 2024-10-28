import 'package:flutter/material.dart';
import 'package:notes_sphere/services/note_service.dart';
import 'package:notes_sphere/utils/app_constants.dart';
import 'package:notes_sphere/utils/app_text_styles.dart';
import 'package:notes_sphere/utils/colors.dart';
import 'package:notes_sphere/widgets/submit_button.dart';

class NoteAddScreen extends StatefulWidget {
  final bool isNewCategery;

  const NoteAddScreen({
    super.key,
    required this.isNewCategery,
  });

  @override
  State<NoteAddScreen> createState() => _NoteAddScreenState();
}

class _NoteAddScreenState extends State<NoteAddScreen> {
  @override
  void initState() {
    loadCategeroy();
    super.initState();
  }

  List<String> loadAllNotesWithCategory = [];

  //form key
  final GlobalKey _formKey = GlobalKey<FormState>();

  //contrallers
  final TextEditingController _categoryContraller = TextEditingController();
  final TextEditingController _newCategoryContraller = TextEditingController();
  final TextEditingController _noteTitle = TextEditingController();
  final TextEditingController _noteContent = TextEditingController();

  //loadv note categorys
  Future<void> loadCategeroy() async {
    List<String> allNotesModelsList = await NoteService().loadCategory();

    setState(() {
      loadAllNotesWithCategory = allNotesModelsList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Create Note",
          style: AppTextStyles.appSubTitle,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(
                height: 30,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    widget.isNewCategery
                        ? TextFormField(
                            validator: (value) {
                              if (value == null) {
                                return "Please Enter Category !";
                              } else {
                                return null;
                              }
                            },
                            controller: _newCategoryContraller,
                            style: AppTextStyles.appLaegeDescription,
                            decoration: InputDecoration(
                              filled: false,
                              fillColor: AppColor.kCardColor,
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppColor.kWhiteColor.withOpacity(0.5),
                                ),
                                borderRadius: BorderRadius.circular(
                                  AppConstants.kDefaultPdding,
                                ),
                              ),
                              hintText: "New Category",
                              hintStyle:
                                  AppTextStyles.appLaegeDescription.copyWith(
                                fontWeight: FontWeight.w600,
                                color: AppColor.kWhiteColor.withOpacity(0.7),
                              ),
                            ),
                          )
                        : DropdownButtonFormField(
                            validator: (value) {
                              if (value == null) {
                                return "Please Select Category !";
                              } else {
                                return null;
                              }
                            },
                            hint: const Text("Select Category !"),
                            style: AppTextStyles.appLaegeDescription,
                            decoration: InputDecoration(
                              filled: false,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  AppConstants.kDefaultPdding,
                                ),
                              ),
                            ),
                            items: loadAllNotesWithCategory.map(
                              (e) {
                                return DropdownMenuItem(
                                  value: e,
                                  child: Text(
                                    e.toString(),
                                  ),
                                );
                              },
                            ).toList(),
                            onChanged: (value) {},
                          ),
                    const SizedBox(
                      height: AppConstants.kDefaultPdding,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null) {
                          return "Please Enter Note Title !";
                        } else {
                          return null;
                        }
                      },
                      maxLines: 2,
                      controller: _noteTitle,
                      style: AppTextStyles.appTitle.copyWith(
                        fontSize: 40,
                      ),
                      decoration: InputDecoration(
                        filled: false,
                        fillColor: AppColor.kCardColor,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(
                            AppConstants.kDefaultPdding,
                          ),
                        ),
                        hintText: "Note Title",
                        hintStyle: AppTextStyles.appLaegeDescription.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColor.kWhiteColor.withOpacity(0.7),
                          fontSize: 40,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: AppConstants.kDefaultPdding / 2,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null) {
                          return "Please Enter Your Content !";
                        } else {
                          return null;
                        }
                      },
                      maxLines: 12,
                      controller: _noteContent,
                      style: AppTextStyles.appTitle.copyWith(
                        fontSize: 20,
                      ),
                      decoration: InputDecoration(
                        filled: false,
                        fillColor: AppColor.kCardColor,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(
                            AppConstants.kDefaultPdding,
                          ),
                        ),
                        hintText: "Note Content",
                        hintStyle: AppTextStyles.appLaegeDescription.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColor.kWhiteColor.withOpacity(0.7),
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Divider(
                thickness: 2,
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {},
                child: const SubmitButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
