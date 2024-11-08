import 'package:flutter/material.dart';
import 'package:notes_sphere/helpers/app_helpers.dart';

import 'package:notes_sphere/models/notes_model.dart';
import 'package:notes_sphere/services/note_service.dart';
import 'package:notes_sphere/utils/app_constants.dart';
import 'package:notes_sphere/utils/app_text_styles.dart';
import 'package:notes_sphere/utils/colors.dart';
import 'package:notes_sphere/utils/routers/app_routers.dart';

class NoteEditScreen extends StatefulWidget {
  final NotesModel note;

  const NoteEditScreen({
    super.key,
    required this.note,
  });

  @override
  State<NoteEditScreen> createState() => _NoteEditScreenState();
}

class _NoteEditScreenState extends State<NoteEditScreen> {
  @override
  void initState() {
    _categoryContraller = widget.note.categeory;
    _noteTitle.text = widget.note.title;
    _noteContent.text = widget.note.content;
    loadCategeroy();
    super.initState();
  }

  Set<String> loadAllNotesWithCategory = {};

  //form key
  final _formKey = GlobalKey<FormState>();

  //contrallers
  String _categoryContraller = "";

  final TextEditingController _noteTitle = TextEditingController();
  final TextEditingController _noteContent = TextEditingController();

  //loadv note categorys
  Future<void> loadCategeroy() async {
    Set<String> allNotesModelsList = await NoteService().loadCategory();

    setState(() {
      loadAllNotesWithCategory = allNotesModelsList;
    });
  }

  //despose
  @override
  void dispose() {
    _noteTitle.dispose();
    _noteContent.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Note",
          style: AppTextStyles.appSubTitle,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    DropdownButtonFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Select Category !";
                        } else {
                          return null;
                        }
                      },
                      value: _categoryContraller,
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
                      onChanged: (value) {
                        setState(() {
                          _categoryContraller = value!;
                        });
                      },
                    ),
                    const SizedBox(
                      height: AppConstants.kDefaultPdding,
                    ),
                    TextFormField(
                      controller: _noteTitle,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter Note Title !";
                        } else {
                          return null;
                        }
                      },
                      maxLines: 2,
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
                      controller: _noteContent,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter Your Content !";
                        } else {
                          return null;
                        }
                      },
                      maxLines: 12,
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
                    const SizedBox(
                      height: 5,
                    ),
                    const Divider(
                      thickness: 2,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          style: const ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                              AppColor.kFaBuColor,
                            ),
                          ),
                          onPressed: () async {
                            try {
                              if (_formKey.currentState!.validate()) {
                                await NoteService().updateNotes(
                                  NotesModel(
                                    title: _noteTitle.text,
                                    categeory: _categoryContraller,
                                    content: _noteContent.text,
                                    date: DateTime.now(),
                                    id: widget.note.id,
                                  ),
                                );
                              }

                              if (context.mounted) {
                                AppHelpers.appMessenger(
                                    context, "Note update successfuly");
                              }

                              //navigate
                              AppRouters.appRoute.go("/Notes");
                            } catch (e) {
                              print(e.toString());

                              if (context.mounted) {
                                AppHelpers.appMessenger(
                                    context, "Failed to update note");
                              }
                            }
                          },
                          child: Text(
                            "Update note",
                            style: AppTextStyles.appLaegeDescription,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
