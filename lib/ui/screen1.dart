import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdbrating/BLOC/imdb_bloc.dart';
import 'package:imdbrating/REPOSITRY/MODELCLASS/Imdbmodel.dart';

class screen1 extends StatefulWidget {
  const screen1({super.key});

  @override
  State<screen1> createState() => _screen1State();
}

late Imdbmodel imdb;

class _screen1State extends State<screen1> {
  @override
  void initState() {
    BlocProvider.of<ImdbBloc>(context).add(Fetchimdb());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow,
          title: Text(
            "IMDB",
            style: TextStyle(
                fontSize: 19, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        body: BlocBuilder<ImdbBloc, ImdbState>(builder: (context, state) {
          if (state is ImdbLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ImdbError) {
            return RefreshIndicator(
              onRefresh: () async {
                return BlocProvider.of<ImdbBloc>(context).add(Fetchimdb());
              },
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: SizedBox(
                    height: MediaQuery.of(context).size.height * .9,
                    // color: Colors.red,
                    child:
                        const Center(child: Text('Oops something went wrong'))),
              ),
            );
          }
          if (state is ImdbLoaded) {
            imdb = BlocProvider.of<ImdbBloc>(context).imdbmodel;
            return ListView.builder(
              itemCount: imdb.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 270,
                      width: 375,
                      color: Colors.blueAccent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 70,
                            width: 70,
                            child: imdb.data![index].image == null
                                ? Image.asset(
                                    "asset/3.png",
                                    fit: BoxFit.fill,
                                  )
                                : Image.network(
                                    "${imdb.data![index].image.toString()}",
                                    fit: BoxFit.fill,
                                  ),
                          ),
                          Text(
                            "title    :  ${imdb.data![index].title.toString()}",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 17,
                                color: Colors.black),
                          ),
                          Text(
                            "id       :  ${imdb.data![index].id.toString()}",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 17,
                                color: Colors.black),
                          ),
                          Text(
                            "qid     :  ${imdb.data![index].qid.toString()}",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 17,
                                color: Colors.black),
                          ),
                          Text(
                            "year   :  ${imdb.data![index].year.toString()}",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 17,
                                color: Colors.black),
                          ),
                          Text(
                            "stars  :  ${imdb.data![index].stars.toString()}",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 17,
                                color: Colors.black),
                          ),
                          Text(
                            "q        :  ${imdb.data![index].q.toString()}",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 17,
                                color: Colors.black),
                          )
                        ],
                      ),
                    )
                  ],
                );
              },
            );
          } else {
            return SizedBox();
          }
        }));
  }
}
