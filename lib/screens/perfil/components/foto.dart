import 'package:flutter/material.dart';
import 'package:zionApp/constants.dart';
import 'package:zionApp/size_config.dart';

class FotoSection extends StatefulWidget {
  dynamic usuario;
  FotoSection({this.usuario});

  @override
  _FotoSectionState createState() =>
      _FotoSectionState(usuario["usuario"]["imagen"] as String);
}

class _FotoSectionState extends State<FotoSection> {
  String imagen;
  String defaultImagen = "https://api.practical.com.ec/public/user.png";
  _FotoSectionState(this.imagen);
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
              (widget.usuario["usuario"]["nombres"] ?? "Sin nombre") as String,
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
            decoration:
                const BoxDecoration(shape: BoxShape.circle, color: kPrimaryColor),
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
