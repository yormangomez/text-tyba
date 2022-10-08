import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_tyba/features/home/presentation/bloc/home_bloc.dart';

class ViewUniversity extends StatelessWidget {
  final String? name;

  final String? codeP;
  final String? country;
  final String? domains;
  final String? web;

  final TextEditingController controllerEdit = TextEditingController();

  final ImagePicker? picker = ImagePicker();

  ViewUniversity({
    Key? key,
    this.codeP,
    this.country,
    this.web,
    this.domains,
    this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    return Container(
                      width: double.infinity,
                      height: 250,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: state.picker != null
                          ? Image.file(File(state.picker!), fit: BoxFit.cover)
                          : Center(child: Text('Foto')),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  minWidth: double.infinity,
                  elevation: 5.0,
                  height: 50.0,
                  color: Colors.blueAccent,
                  onPressed: () async {
                    final XFile? pickedFile =
                        await picker!.pickImage(source: ImageSource.camera);
                    if (pickedFile == null) {
                      print('no selecciono nada');
                      return;
                    }
                    print(pickedFile.path);

                    context.read<HomeBloc>().add(
                          UniversityInforEvent(pickedFile: pickedFile.path),
                        );
                  },
                  child: Text('Tomar foto'),
                ),
              ),
              const Text('nombre'),
              Text('$name'),
              const Text('Codigo del pais'),
              Text('$codeP'),
              const Text('Pais'),
              Text('$country'),
              const Text('dominios'),
              Text('$domains'),
              const Text('web'),
              Text('$web'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: controllerEdit,
                  autocorrect: false,
                  //  obscureText: isObscureTetxt,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.grey,
                      width: 2,
                    )),
                    hintText: 'Cantidad de estudiantes',
                    labelText: 'Cantidad de estudiantes',
                    labelStyle: const TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      minWidth: double.infinity,
                      elevation: 5.0,
                      height: 50.0,
                      color: Colors.lightGreen,
                      onPressed: () async {
                        Navigator.pop(context);
                        print(controllerEdit.text);
                        context.read<HomeBloc>().add(UniversityPageEvent());

                        context.read<HomeBloc>().add(UniversityGuardarEvent(
                              pickedFile:
                                  state.picker != null ? state.picker! : '',
                              study: controllerEdit.text,
                            ));
                      },
                      child: Text('Guardar'),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
