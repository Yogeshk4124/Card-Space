import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// const Map<CardType, String> CardTypeIconAsset = <CardType, String>{
//   CardType.visa: 'icons/visa.png',
//   CardType.americanExpress: 'icons/amex.png',
//   CardType.mastercard: 'icons/mastercard.png',
//   CardType.discover: 'icons/discover.png',
// };
class CardCompany {
  static CardCompany americanExpress = CardCompany(
    Text(
      'AMERICAN \nEXPRESS',
      textAlign: TextAlign.right,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w800,
        fontSize: 16,
      ),
    ),
  );

  static CardCompany virgin = CardCompany(
    Image.asset(
      'assets/cardslider/virgin.png',
      height: 40,
    ),
  );

  static CardCompany sbi = CardCompany(
    Image.asset(
      'assets/cardslider/sbi_card.gif',
      height: 35,
    ),
  );

  static CardCompany sbiCard = CardCompany(
    Image.asset(
      'assets/cardslider/sbi.png',
      height: 35,
    ),
  );

  static CardCompany kotak = CardCompany(
    Image.asset(
      'assets/cardslider/kotak_logo.png',
      height: 35,
    ),
  );

  static CardCompany axisBank = CardCompany(
    Image.asset(
      'assets/cardslider/axis_bank_logo.png',
      height: 35,

    ),
  );

  static CardCompany axisBankWhite = CardCompany(
    Image.asset(
      'assets/cardslider/axis_bank_logo.png',
      height: 35,
      color: Colors.white,
    ),
  );

  static CardCompany citiBank = CardCompany(
    Image.asset(
      'assets/cardslider/citibank_logo.png',
      height: 25,
    ),
  );

  static CardCompany hdfc = CardCompany(
    Image.asset(
      'assets/cardslider/hdfc_logo.png',
      height: 25,
    ),
  );

  static CardCompany hsbc = CardCompany(
    Image.asset(
      'assets/cardslider/hsbc_logo.png',
      height: 30,
    ),
  );

  static CardCompany icici = CardCompany(
    Image.asset(
      'assets/cardslider/icici_bank_logo.png',
      height: 25,
    ),
  );

  static CardCompany indusland = CardCompany(
    Image.asset(
      'assets/cardslider/indusland.png',
      height: 15,
    ),
  );

  static CardCompany yesBank = CardCompany(
    Image.asset(
      'assets/cardslider/yes_bank_logo.png',
      height: 35,
    ),
  );

  final Widget widget;

  const CardCompany(this.widget);
}

class Validity {
  final int validThruMonth;
  final int validThruYear;
  final int validFromMonth;
  final int validFromYear;

  Validity({
    @required this.validThruMonth,
    @required this.validThruYear,
    this.validFromMonth,
    this.validFromYear,
  }) {
    assert(validThruMonth != null);
    assert(validThruYear != null);
    if (validFromMonth != null || validFromYear != null) {
      assert(validFromMonth != null);
      assert(validFromYear != null);
    }
  }
}

abstract class CardBackground {}

class SolidColorCardBackground extends CardBackground {
  final Color backgroundColor;

  SolidColorCardBackground(this.backgroundColor);
}

class GradientCardBackground extends CardBackground {
  final Gradient gradient;

  GradientCardBackground(this.gradient);
}

class ImageCardBackground extends CardBackground {
  final ImageProvider imageProvider;
  final BoxFit boxFit;

  ImageCardBackground(this.imageProvider, {
    this.boxFit = BoxFit.cover,
  });

  DecorationImage build() {
    return DecorationImage(
      image: imageProvider,
      fit: boxFit,
    );
  }
}

class CardNetworkType {
  static CardNetworkType visa = CardNetworkType(
    Image.asset(
      'assets/cardslider/visa.jpeg',
      height: 35,
    ),
  );

  static CardNetworkType mastercard = CardNetworkType(
    Image.asset(
      'assets/cardslider/mastercard.png',
      height: 40,
    ),
  );

  static CardNetworkType visaBasic = CardNetworkType(
    Image.asset(
      'assets/cardslider/visa_basic.png',
      height: 20,
    ),
  );

  static CardNetworkType rupay = CardNetworkType(
    Image.asset(
      'assets/cardslider/rupay_logo.png',
      height: 40,
    ),
  );

  static CardNetworkType discover = CardNetworkType(
      Image.asset(
        'assets/flutter/discover.png',
        height: 48,
        width: 48,
      )
  );

  static CardNetworkType amex = CardNetworkType(
      Image.asset(
        'assets/flutter/amex.png',
        height: 48,
        width: 48,
      )
  );

  static CardNetworkType other = CardNetworkType(
    Container(
      height: 40,
      width: 40,
      child: Text('XYZ'),
    ),
  );

  final Widget widget;

  const CardNetworkType(this.widget);
}

class CreditCardWidget extends StatefulWidget {
  final CardBackground cardBackground;
  final CardNetworkType cardNetworkType;
  final CardCompany company;
  final String cardHolderName;
  final String cardNumber;
  final double roundedCornerRadius;
  final Validity validity;
  bool showBackView;
  final Color numberColor;
  final Color validityColor;
  final Color cardHolderNameColor;
  final bool showChip;
  final Duration animationDuration;
  final bool obscureCardCvv;
  final String cvvCode;
  final double height;
  final double width;
  final AnimationController Acontroller;
  final TextStyle textStyle;

  CreditCardWidget({
    @required this.cardBackground,
    this.animationDuration = const Duration(milliseconds: 500),
    this.cardNetworkType,
    this.cardNumber,
    this.height,
    this.width,
    this.Acontroller,
    this.textStyle,
    this.cardHolderName,
    this.cvvCode,
    this.obscureCardCvv = true,
    this.showBackView,
    this.company,
    this.validity,
    this.roundedCornerRadius = 20,
    this.numberColor = Colors.white,
    this.validityColor = Colors.white,
    this.cardHolderNameColor = Colors.white,
    this.showChip = true,
  });

  @override
  _CreditCardWidgetState createState() => _CreditCardWidgetState();
}

class _CreditCardWidgetState extends State<CreditCardWidget>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> _frontRotation;
  Animation<double> _backRotation;
  Gradient backgroundGradientColor;

  bool isAmex = false;
  TextEditingController cvvController=new TextEditingController();
  @override
  void initState() {
    super.initState();
    cvvController.text=widget.cvvCode.toString();
    ///initialize the animation controller
    controller = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );

    ///Initialize the Front to back rotation tween sequence.
    _frontRotation = TweenSequence<double>(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: pi / 2)
              .chain(CurveTween(curve: Curves.easeIn)),
          weight: 50.0,
        ),
        TweenSequenceItem<double>(
          tween: ConstantTween<double>(pi / 2),
          weight: 50.0,
        ),
      ],
    ).animate(controller);

    _backRotation = TweenSequence<double>(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: ConstantTween<double>(pi / 2),
          weight: 50.0,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: -pi / 2, end: 0.0)
              .chain(CurveTween(curve: Curves.easeOut)),
          weight: 50.0,
        ),
      ],
    ).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery
        .of(context)
        .size
        .height;
    final double width = MediaQuery
        .of(context)
        .size
        .width;
    final Orientation orientation = MediaQuery
        .of(context)
        .orientation;

    ///
    /// If uer adds CVV then toggle the card from front to back..
    /// controller forward starts animation and shows back layout.
    /// controller reverse starts animation and shows front layout.
    ///
    if (widget.showBackView) {
      controller.forward();
    } else {
      controller.reverse();
    }

    return Stack(
      children: <Widget>[
        AnimationCard(
          animation: _frontRotation,
          child: buildFrontContainer(width, height, context, orientation),
        ),
        AnimationCard(
          animation: _backRotation,
          child: buildBackContainer(width, height, context, orientation),
        ),
      ],
    );
  }

  Container buildBackContainer(double width,
      double height,
      BuildContext context,
      Orientation orientation,) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: 300,
      height: 200,
      decoration: _buildBackground(),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              _buildBackSide(),
              // _buildCVV(),
            ],
          ),
        ],
      ),
    );
  }

  // Container _buildCVV() {
  //   return
  // }

  Container buildFrontContainer(double width,
      double height,
      BuildContext context,
      Orientation orientation,) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: 300,
      height: 200,
      decoration: _buildBackground(),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          widget.company != null
              ? Align(
            alignment: Alignment.centerLeft,
            child: widget.company.widget,
          )
              : SizedBox.shrink(),
          widget.showChip ? _buildChip() : SizedBox.shrink(),
          Column(
            children: <Widget>[
              _buildCardNumber(),
              SizedBox(height: 4),
              _buildValidity(),
              SizedBox(height: 4),
              _buildNameAndCardNetworkType(),
            ],
          ),
        ],
      ),
    );
  }

  _buildBackground() {
    if (widget.cardBackground is SolidColorCardBackground) {
      SolidColorCardBackground solidColorCardBackground =
      widget.cardBackground as SolidColorCardBackground;
      return BoxDecoration(
        borderRadius: BorderRadius.circular(widget.roundedCornerRadius),
        color: solidColorCardBackground.backgroundColor,
      );
    } else if (widget.cardBackground is GradientCardBackground) {
      GradientCardBackground gradientCardBackground =
      widget.cardBackground as GradientCardBackground;
      return BoxDecoration(
        borderRadius: BorderRadius.circular(widget.roundedCornerRadius),
        gradient: gradientCardBackground.gradient,
      );
    } else if (widget.cardBackground is ImageCardBackground) {
      ImageCardBackground imageCardBackground =
      widget.cardBackground as ImageCardBackground;
      return BoxDecoration(
        borderRadius: BorderRadius.circular(widget.roundedCornerRadius),
        image: imageCardBackground.build(),
      );
    } else {
      return BoxDecoration(
        borderRadius: BorderRadius.circular(widget.roundedCornerRadius),
        color: Colors.black,
      );
    }
  }

  _buildChip() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
      alignment: Alignment.centerLeft,
      child: Image.asset(
        'assets/cardslider/chip.png',
        height: 25,
        package: 'credit_card_slider',
      ),
    );
  }

  _buildCardNumber() {
    if (widget.cardNumber.trim() == "") {
      return SizedBox.shrink();
    }
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        widget.cardNumber,
        style: TextStyle(
          fontFamily: 'creditcard',
          package: 'credit_card_slider',
          color: widget.numberColor,
          fontSize: 11,
        ),
      ),
    );
  }

  _buildValidity() {
    if (widget.validity == null) {
      return SizedBox.shrink();
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        widget.validity.validFromMonth != null ||
            widget.validity.validFromYear != null
            ? Column(
          children: <Widget>[
            Text(
              'VALID FROM',
              style: TextStyle(
                color: widget.validityColor,
                fontSize: 8,
              ),
            ),
            SizedBox(height: 2),
            Text(
              '${widget.validity.validFromMonth.toString().padLeft(
                  2, '0')}/${widget.validity.validFromYear.toString().padLeft(
                  2, '0')}',
              style: TextStyle(
                color: widget.validityColor,
                fontSize: 10,
                fontFamily: 'creditcard',
                package: 'credit_card_slider',
              ),
            ),
          ],
        )
            : SizedBox.shrink(),
        widget.validity.validFromMonth != null ||
            widget.validity.validFromYear != null
            ? SizedBox(width: 24)
            : SizedBox.shrink(),
        Column(
          children: <Widget>[
            Text(
              'VALID THRU',
              style: TextStyle(
                color: widget.validityColor,
                fontSize: 8,
              ),
            ),
            SizedBox(height: 2),
            Text(
              '${widget.validity.validThruMonth.toString().padLeft(
                  2, '0')}/${widget.validity.validThruYear.toString().padLeft(
                  2, '0')}',
              style: TextStyle(
                color: widget.validityColor,
                fontSize: 10,
                fontFamily: 'creditcard',
                package: 'credit_card_slider',
              ),
            ),
          ],
        )
      ],
    );
  }
  _buildNameAndCardNetworkType() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        widget.cardHolderName != null
            ? Expanded(
          flex: 3,
          child: AutoSizeText(
            widget.cardHolderName.toUpperCase(),
            maxLines: 1,
            minFontSize: 8,
            style: TextStyle(
              fontFamily: 'creditcard',
              color: widget.cardHolderNameColor,
              package: 'credit_card_slider',
            ),
          ),
        )
            : SizedBox.shrink(),
        SizedBox(width: 16),
        Expanded(
          child: _buildCardNetworkType(),
        )
      ],
    );
  }

  _buildBackSide() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            widget.company != null ?
            widget.company.widget
                : SizedBox.shrink(),
            SizedBox(width: 16),
            Expanded(
              child: _buildCardNetworkType(),
            )
          ],
        ),

        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              color: Colors.grey,
              height: 30,
              width: 200,
            ),
            Container(
              width: 50,
              height: 50,
              child:TextField(
                controller: cvvController,
                decoration: InputDecoration(
                    labelText: "CVV",
                    labelStyle:GoogleFonts.aBeeZee(),
                    disabledBorder: InputBorder.none,
                    enabledBorder: InputBorder.none
                ),
              ),
            )

          ],
        ),
        widget.cardHolderName != null
            ?  AutoSizeText(
          widget.cardHolderName.toUpperCase(),
          maxLines: 1,
          minFontSize: 8,
          style: TextStyle(
            fontFamily: 'creditcard',
            color: widget.cardHolderNameColor,
            package: 'credit_card_slider',
          ),
        )
            : SizedBox.shrink(),
      ],
    );
  }

  _buildCardNetworkType() {
    if (widget.cardNetworkType == null) {
      return SizedBox.shrink();
    }
    return widget.cardNetworkType.widget;
  }
}

class AnimationCard extends StatelessWidget {
  const AnimationCard({
    @required this.child,
    @required this.animation,
  });

  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget child) {
        final Matrix4 transform = Matrix4.identity();
        transform.setEntry(3, 2, 0.001);
        transform.rotateY(animation.value);
        return Transform(
          transform: transform,
          alignment: Alignment.center,
          child: child,
        );
      },
      child: child,
    );
  }
}
