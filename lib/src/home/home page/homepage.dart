import 'package:flutter/material.dart';
import 'package:sinfo/src/home/details%20page/details_info.dart';
import 'package:sinfo/src/home/add/add_student.dart';
import 'package:sinfo/src/home/home%20page/functionalities/add_student_in_db.dart';
import 'package:sinfo/src/home/home%20page/functionalities/delete_student.dart';
import 'package:sinfo/src/home/home%20page/functionalities/fetch_all_student_info.dart';
import 'package:sinfo/src/home/profile/fetch_profiledata.dart';
import 'package:sinfo/src/informations/user_info.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});
  // static final db = Db();

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final FetchProfiledata fechprof = FetchProfiledata();
  final AddStudentInDb addStudentInDb = AddStudentInDb();
  final FetchAllStudentInfo fetchall = FetchAllStudentInfo();
  final DeleteStudentService deletestudent = DeleteStudentService();
  final List<Map> value = [];

  void refresh() {
    setState(() {
      fetchall.fetchUserTableData(usrinfo['id'].toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return PopScope(
      canPop: true,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
          automaticallyImplyLeading: false,
          title: const Text("Home page"),
          leading: IconButton(
            tooltip: "Refresh",
            onPressed: () {
              refresh();
            },
            icon: const Icon(
              Icons.refresh,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                var usermail = loginemail;

                fechprof.fetchUserByEmail(context, usermail, '');
              },
              icon: const Icon(
                Icons.account_circle_rounded,
              ),
            ),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            refresh();
          },
          child: FutureBuilder<List<Map<String, dynamic>>>(
            future: fetchall.fetchUserTableData(
              usrinfo['id'].toString(),
            ),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text("Error: ${snapshot.error}"));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text("No data found."));
              } else {
                final List<Map<String, dynamic>> data = snapshot.data!;
                return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final row = data[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 3.0, top: 1),
                      child: Dismissible(
                        onDismissed: (direction) {
                          deletestudent.deleteStudent(
                            userId: usrinfo['id'].toString(),
                            itemIndex: row['id'].toString(),
                          );
                          refresh();
                        },
                        background: Container(
                          color: Colors.red,
                          child: const Center(
                            child: Text(
                              "Delete",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                        key: Key(row['id'].toString()),
                        child: SizedBox(
                          width: w,
                          child: ListTile(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => DetailsInfo(
                                    id: row['id'],
                                    name: row["name"],
                                    email: row["email"],
                                    idnumber: row["idnumber"],
                                    dept: row["dept"],
                                  ),
                                ),
                              );
                            },
                            tileColor: Colors.blue,
                            title: Text(row['name'] ?? "No Name"),
                            subtitle: Text(row['idnumber'] ?? "No Email"),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            var infos = await showDialog(
              context: context,
              builder: (context) => AddStudent(),
            );
            if (infos is! Map) {
              return;
            } else {
              addStudentInDb.addUserToTable(
                id: usrinfo['id'].toString(),
                idnumber: infos['id'],
                name: infos['name'],
                email: infos['email'],
                dept: infos['dept'],
              );

              refresh();
            }
          },
          child: const Icon(
            Icons.add,
          ),
        ),
      ),
    );
  }
}
