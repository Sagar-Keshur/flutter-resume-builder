import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_resume_builder/models/resume.dart';
import 'package:flutter_resume_builder/provider/form_provider.dart';
import 'package:flutter_resume_builder/repositories/resume_repo.dart';
import 'package:flutter_resume_builder/views/pages/form_input.dart';
import 'package:flutter_resume_builder/views/widgets/resume_tile.dart';
import 'package:flutter_resume_builder/views/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String route = '/';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ResumeRepository repository = ResumeRepository();
  late final FormProvider _provider;
  @override
  void initState() {
    super.initState();
    _provider = context.read<FormProvider>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _provider.fetch();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _provider.clear();
          Navigator.pushNamed(context, FormInputPage.route);
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SafeArea(
          child: RefreshIndicator(
            onRefresh: () async {
              await _provider.fetch();
            },
            child: Consumer<FormProvider>(
              builder: (context, provider, widget) {
                return widgetDelegate(
                  shouldShowPrimary: !provider.loading,
                  primaryWidget: () {
                    return widgetDelegate(
                      shouldShowPrimary: provider.resumes.isNotEmpty,
                      primaryWidget: () {
                        return ReorderableListView(
                          onReorder: (int oldIndex, int newIndex) {
                            if (oldIndex < newIndex) {
                              newIndex -= 1;
                            }
                            provider.updateIndex(
                              oldIndex: oldIndex,
                              newIndex: newIndex,
                            );
                          },
                          children: provider.resumes.map((resume) {
                            return ResumeTileWidget(
                              key: Key(resume.id!),
                              model: resume,
                              onDelete: () {
                                _provider.onDelete(resume.id!);
                              },
                              onEdit: () {
                                _provider.clear();
                                _provider.onEdit(resume);
                                Navigator.pushNamed(
                                    context, FormInputPage.route);
                              },
                            );
                          }).toList(),
                        );
                      },
                      alternateWidget: () {
                        return const Center(child: Text('No Results Found'));
                      },
                    );
                  },
                  alternateWidget: () {
                    return const Center(child: CircularProgressIndicator());
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
