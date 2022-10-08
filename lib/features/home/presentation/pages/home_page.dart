import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_tyba/features/home/presentation/bloc/home_bloc.dart';
import 'package:test_tyba/features/home/presentation/widget/card_university.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<HomeBloc>().add(UniversityPageEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            const TabBar(
              physics: PageScrollPhysics(),
              labelColor: Colors.black,
              tabs: [
                Tab(text: 'Lista vertical'),
                Tab(text: 'Lista Horizontal'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      return state.isUniversity
                          ? ListView.builder(
                              itemCount: state.universityList!.length,
                              itemBuilder: (context, index) {
                                final universityData =
                                    state.universityList![index];

                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CardUniversity(
                                    height: 250.0,
                                    name: universityData.name,
                                    codeP: universityData.alphaTwoCode,
                                    country: universityData.country,
                                    domains: universityData.domains![0],
                                    web: universityData.webPages![0],
                                  ),
                                );
                              },
                            )
                          : const Center(
                              child: CircularProgressIndicator(),
                            );
                    },
                  ),
                  BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      return state.isUniversity
                          ? GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 1,
                                mainAxisSpacing: 1,
                              ),
                              itemCount: state.universityList!.length,
                              itemBuilder: (context, index) {
                                final universityData =
                                    state.universityList![index];
                                return Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: CardUniversity(
                                    height: 100,
                                    name: universityData.name,
                                    codeP: universityData.alphaTwoCode,
                                    country: universityData.country,
                                    domains: universityData.domains![0],
                                    web: universityData.webPages![0],
                                  ),
                                );
                              },
                            )
                          : const Center(
                              child: CircularProgressIndicator(),
                            );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      /*BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return state.isUniversity
              ? ListView.builder(
                  itemCount: state.universityList!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: double.infinity,
                        height: 200,
                        color: Colors.blue,
                      ),
                    );
                  },
                )
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),*/
    );
  }
}
