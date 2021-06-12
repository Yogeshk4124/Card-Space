import 'package:auto_size_text/auto_size_text.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../CardClasses/mCard.dart';

class cCard extends StatefulWidget {
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
  final TextStyle textStyle;

  cCard({
    @required this.cardBackground,
    this.animationDuration = const Duration(milliseconds: 500),
    this.cardNetworkType,
    this.cardNumber,
    this.height,
    this.width,
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
  _cCardState createState() => _cCardState();
}

class _cCardState extends State<cCard> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    final Orientation orientation = MediaQuery.of(context).orientation;
    return FlipCard(
      speed: 500,
      direction: FlipDirection.HORIZONTAL, // default
      front: Container(
        child: buildFrontContainer(width, height, context, orientation),
      ),
      back: Container(
        child: buildBackContainer(width, height, context, orientation),
      ),
    );
  }

  Container buildBackContainer(
    double width,
    double height,
    BuildContext context,
    Orientation orientation,
  ) {
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

  Container buildFrontContainer(
    double width,
    double height,
    BuildContext context,
    Orientation orientation,
  ) {
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
        style: GoogleFonts.quantico(
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
                    '${widget.validity.validFromMonth.toString().padLeft(2, '0')}/${widget.validity.validFromYear.toString().padLeft(2, '0')}',
                    style: GoogleFonts.quantico(
                      fontSize: 11,
                      color: widget.validityColor,
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
              '${widget.validity.validThruMonth.toString().padLeft(2, '0')}/${widget.validity.validThruYear.toString().padLeft(2, '0')}',
              style: GoogleFonts.quantico(
                fontSize: 11,
                color: widget.validityColor,
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
                  style: GoogleFonts.quantico(
                  color: widget.cardHolderNameColor,
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
            widget.company != null ? widget.company.widget : SizedBox.shrink(),
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
              child: TextField(
                controller: TextEditingController(text: widget.cvvCode),
                decoration: InputDecoration(
                    labelText: "CVV",
                    labelStyle: GoogleFonts.aBeeZee(),
                    disabledBorder: InputBorder.none,
                    enabledBorder: InputBorder.none),
              ),
            )
          ],
        ),
        widget.cardHolderName != null
            ? AutoSizeText(
                widget.cardHolderName.toUpperCase(),
                maxLines: 1,
                minFontSize: 8,
                style: GoogleFonts.quantico(
                  color: widget.cardHolderNameColor,
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
