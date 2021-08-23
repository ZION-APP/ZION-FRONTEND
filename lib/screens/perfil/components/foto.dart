import 'package:flutter/material.dart';
import 'package:zionapp/constants_config.dart';
import 'package:zionapp/size_config.dart';

class FotoSection extends StatefulWidget {
  final dynamic usuario;
  const FotoSection(this.usuario);

  @override
  _FotoSectionState createState() => _FotoSectionState();
}

class _FotoSectionState extends State<FotoSection> {
  String imagen;
  String defaultImagen = "https://api.practical.com.ec/public/user.png";
  _FotoSectionState();
  @override
  void initState() {
    imagen = widget.usuario["url_profile"] as String;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: kSecondaryColor,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: 8.0, bottom: getProportionateScreenHeight(30)),
            child: CircleAvatar(
              radius: getProportionateScreenHeight(60),
              backgroundImage: NetworkImage(imagen ?? defaultImagen),
              backgroundColor: kPrimaryColor,
              onBackgroundImageError: (obj, err) {
                setState(() {
                  imagen = defaultImagen;
                });
              },
              child: _botonCamara(),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Text(
              "${widget.usuario["firstname"] ?? ""}  ${widget.usuario["lastname"] ?? ""}" ??
                  "Sin nombre",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: getProportionateScreenHeight(20),
                  color: kPrimaryLightColor),
            ),
          )
        ],
      ),
    );
  }

  Transform _botonCamara() {
    return Transform.translate(
        offset: Offset(
            getProportionateScreenHeight(40), getProportionateScreenHeight(40)),
        child: GestureDetector(
          onTap: () {},
          child: Container(
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: kPrimaryColor),
            child: Padding(
              padding: EdgeInsets.all(getProportionateScreenHeight(8)),
              child: const Icon(
                Icons.camera_alt,
                color: kPrimaryLightColor,
              ),
            ),
          ),
        ));
  }
}
