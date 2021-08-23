import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zionapp/constants_config.dart';
import 'package:zionapp/bloc/auth/auth_bloc.dart';
import 'package:zionapp/bloc/auth/auth_event.dart';
import 'package:zionapp/bloc/auth/auth_state.dart';
import 'package:zionapp/components/button_default.dart';
import 'package:zionapp/components/cargando.dart';
import 'package:zionapp/routes/router.gr.dart';
import 'package:zionapp/screens/login/components.dart/formulario.dart';
import 'package:zionapp/size_config.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final usuarioController = TextEditingController();
  final contrasenaController = TextEditingController();
  bool recuerdame = false;
  bool loading = false;

  @override
  void initState() {
    obtenerUsuarioStorage();
    super.initState();
  }

  Future<void> obtenerUsuarioStorage() async {
    usuarioController.text = await storage.read(key: "usuario");
    contrasenaController.text = await storage.read(key: "contrasena");
    final rec = await storage.read(key: "recuerdame");
    if (rec == "true") {
      setState(() {
        recuerdame = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocConsumer<LogInBloc, LogInState>(listener: (context, state) {
        if (state is LogInCompleted) {
          context.router.replace(HomeRoute(titulo: "David"));
          usuarioController.text = "";
          contrasenaController.text = "";
        }
        if (state is LoginFailed) {
          final snackBar = SnackBar(
            content: Text(
              state.error,
              textAlign: TextAlign.center,
            ),
            backgroundColor: kDangerColor,
            duration: const Duration(milliseconds: 1500),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
        if (state is LoginLoading) {
          loading = true;
        } else {
          loading = false;
        }
      }, buildWhen: (previousState, newState) {
        if (previousState is LoginInitial && newState is LoginFailed) {
          return false;
        }
        return true;
      }, builder: (context, state) {
        return SizedBox(
            width: double.infinity,
            child: Column(
              children: _botones(),
            ));
      }),
    );
  }

  List<Widget> _botones() {
    return [
      SizedBox(
        height: SizeConfig.screenHeight * 0.3,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(14)),
          child: SizedBox(
            height: double.infinity,
            child: Image.asset(
              "assets/img/zion-logo.png",
              width: double.infinity,
            ),
          ),
        ),
      ),
      SizedBox(
          height: SizeConfig.screenHeight * 0.18,
          child: FormularioLogin(
            usuarioController: usuarioController,
            contrasenaController: contrasenaController,
            recuerdame: recuerdame,
            formKey: _formKey,
            recuerdameCallback: recuerdameCallback,
          )),
      SizedBox(
        height: SizeConfig.screenHeight * 0.3,
        child: SizedBox(
          height: double.infinity,
          child: Column(
            children: [
              if (loading) Cargando(),
              if (!loading)
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: getProportionateScreenHeight(15)),
                  child: DefaultButton(
                    key: const ValueKey('loginButton'),
                    func: () => {logIn(context)},
                    label: "Iniciar Sesión",
                    colorFondo: loading ? kDisableColor : kPrimaryColor,
                  ),
                ),
              _recuerdame(),
              const Divider(
                thickness: 1,
              ),
              registroLink(),
            ],
          ),
        ),
      ),
    ];
  }

  void logIn(BuildContext context) {
    if (_formKey.currentState.validate()) {
      BlocProvider.of<LogInBloc>(context).add(IniciarSesion(
          usuarioController.text, contrasenaController.text, true));
    }
  }

  Widget _recuerdame() {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenHeight(14)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Checkbox(
                  key: const ValueKey('checkbox'),
                  value: recuerdame,
                  activeColor: kSecondaryColor,
                  onChanged: recuerdameCallback),
              const Text("Recuérdame")
            ],
          ),
          informacionLink()
        ],
      ),
    );
  }

  Widget informacionLink() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10)),
      child: GestureDetector(
        onTap: () {
          AutoRouter.of(context).push(const InformacionRoute());
        },
        child: const Text(
          "¿Necesitas más información?",
          style: TextStyle(color: kSecondaryColor),
        ),
      ),
    );
  }

  Widget registroLink() {
    final recognizer = TapGestureRecognizer()
      ..onTap = () {
        AutoRouter.of(context).push(const RegisterRoute());
      };
    return Padding(
      padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10)),
      child: RichText(
          text: TextSpan(children: [
        const TextSpan(
            text: "¿No tienes una cuenta?  ",
            style: TextStyle(color: kSecondaryColor)),
        TextSpan(
            text: "Registrate",
            style: const TextStyle(
                color: kPrimaryColor, fontWeight: FontWeight.bold),
            recognizer: recognizer)
      ])),
    );
  }

  // ignore: avoid_positional_boolean_parameters
  void recuerdameCallback(bool selected) {
    setState(() {
      recuerdame = selected;
    });
  }
}
