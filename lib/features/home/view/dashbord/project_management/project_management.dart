
import 'package:flutter/material.dart';
import 'package:logestics/features/home/view/dashbord/project_management/projects_analysis.dart';
import 'package:logestics/features/home/view/dashbord/project_management/projects_overview.dart';
import 'package:logestics/features/home/view/dashbord/project_management/projects_progress.dart';
import 'package:logestics/features/home/view/dashbord/project_management/projects_roadmap.dart';
import 'package:logestics/features/home/view/dashbord/project_management/team_members.dart';
import 'package:logestics/features/home/view/dashbord/project_management/working_schedule.dart';
import 'package:provider/provider.dart';

import '../../../theme/theme.dart';
import '../crm/to_do_list.dart';
import 'active_project.dart';
import 'all_projects.dart';
import 'chat_projects_user.dart';

class ProjectManagementView extends StatefulWidget {
  const ProjectManagementView({super.key});

  @override
  State<ProjectManagementView> createState() => _ProjectManagementViewState();
}

class _ProjectManagementViewState extends State<ProjectManagementView> {

  late ColorNotifier notifier;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    notifier = Provider.of(context, listen: true);


    if (width < 850) {
      return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 700,
              width: width,
              child: projectsOverView(context),
            ),
            Container(height: 20),
            SizedBox(
              height: 300,
              child: projectsRoadmap(context),
            ),
            Container(height: 20),
            SizedBox(
              height: 530,
              child: allProjects(context),
            ),
            Container(height: 20),
            SizedBox(
              height: 400,
              width: width,
              child: projectsProgress(context),
            ),
            Container(height: 20),
            SizedBox(
              height: width < 500 ? 900 : 830,
              child: workingSchedule(context),
            ),
            Container(height: 20),
            SizedBox(
              height: 300,
              child: projectsAnalysis(context),
            ),
            Container(height: 20),
            SizedBox(
              height: 500,
              child: chatProjectsUser(context),
            ),
            Container(height: 20),
            SizedBox(
              height: 550,
              width: width,
              child: toDoList(context),
            ),
            Container(height: 20),
            SizedBox(
              height: 450,
              width: width,
              child: activeProject(context),
            ),
            Container(height: 20),
            SizedBox(
              height: 450,
              width: width,
              child: teamMembers(context),
            ),
          ],
        ),
      );
    } else {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 450,
              child: projectsOverView(context),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 400,
              child: projectsRoadmap(context),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 510,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: width / 2,
                    child: allProjects(context),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: SizedBox(
                      child: projectsProgress(context),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            width < 1150
                ? SizedBox(
                    height: 900,
                    width: width,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            child: workingSchedule(context),
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  height: 350,
                                  child: projectsAnalysis(context),
                                ),
                              ),
                              SizedBox(height: 20),
                              Expanded(
                                child: SizedBox(
                                  height: 350,
                                  child: chatProjectsUser(context),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                : SizedBox(
                    height: width < 1600 ? 900 : 910,
                    width: width,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: width < 1300
                              ? width / 3
                              : width < 1600
                                  ? width / 3.5
                                  : width / 4.5,
                          child: workingSchedule(context),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: SizedBox(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 350,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: SizedBox(
                                          child: projectsAnalysis(context),
                                        ),
                                      ),
                                      SizedBox(width:20),
                                      Expanded(
                                        child: SizedBox(
                                          child: chatProjectsUser(context),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20),
                                Expanded(
                                  child: Container(
                                    child: toDoList(context),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
            SizedBox(height: 20),
            width < 1150
                ? Container(
                    decoration: BoxDecoration(),
                    height: 530,
                    child: toDoList(context),
                  )
                : Container(),
            width < 1150 ? SizedBox(height: 20) : Container(),
            SizedBox(
              height: 430,
              child: Row(
                children: [
                  SizedBox(
                    width: width / 2,
                    child: activeProject(context),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Container(
                      child: teamMembers(context),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
    //   },
    // );
  }
}
