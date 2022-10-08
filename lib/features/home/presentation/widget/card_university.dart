import 'package:flutter/material.dart';
import 'package:test_tyba/features/home/presentation/widget/view_university.dart';

class CardUniversity extends StatelessWidget {
  final String? name;

  final String? codeP;
  final String? country;
  final String? domains;
  final String? web;
  final double height;

  const CardUniversity({
    Key? key,
    this.codeP,
    this.country,
    this.web,
    this.domains,
    this.name,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => ViewUniversity(
              name: name,
              codeP: codeP,
              country: country,
              domains: domains,
              web: web,
            ),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.grey,
        ),
        child: Center(
          child: Column(
            children: [
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
            ],
          ),
        ),
      ),
    );
  }
}
