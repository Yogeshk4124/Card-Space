library credit_card_slider;

import 'dart:math';

import 'package:flutter/material.dart';

import 'mCard.dart';

typedef void OnCardClicked(int index);

enum RepeatCards { down, bothDirection, none }

///[initialCard] is 0 based index
///[repeatCards] can have 3 values - [RepeatCards.none], [RepeatCards.down] or [RepeatCards.bothDirection]
///Use [RepeatCards.bothDirection] for repeating cards on both sides
///Use [RepeatCards.down] for repeating cards only down
class CreditCardSlider extends StatefulWidget {
  PageController _pageController;

  final List<CreditCardWidget> creditCards;
  final double percentOfUpperCard;
  final OnCardClicked onCardClicked;
  final RepeatCards repeatCards;
  int initialCard;

  CreditCardSlider(
      this.creditCards, {
        this.onCardClicked,
        this.repeatCards = RepeatCards.none,
        this.initialCard = 0,
        this.percentOfUpperCard = 0.35,
      }) {
    assert(initialCard >= 0);
    assert(initialCard < creditCards.length);
    assert(percentOfUpperCard >= 0);
    assert(percentOfUpperCard <= pi / 2);

    if (repeatCards == RepeatCards.bothDirection) {
      initialCard = (creditCards.length * 1000000) + initialCard;
    }
    _pageController = PageController(
      viewportFraction: 0.3,
      initialPage: initialCard,
    );
  }

  @override
  _CreditCardSliderState createState() => _CreditCardSliderState();
}

class _CreditCardSliderState extends State<CreditCardSlider> {
  @override
  Widget build(BuildContext context) {
    if (widget.repeatCards == RepeatCards.down ||
        widget.repeatCards == RepeatCards.bothDirection) {
      return PageView.builder(
        controller: widget._pageController,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) => _builder(index, widget.creditCards.length),
      );
    }
    return PageView.builder(
      controller: widget._pageController,
      scrollDirection: Axis.vertical,
      itemCount: widget.creditCards.length,
      itemBuilder: (context, index) => _builder(index, widget.creditCards.length),
    );
  }

  _builder(int index, int length) {
    return AnimatedBuilder(
      animation: widget._pageController,
      builder: (context, child) {
        double value = 1.0;

        int mIndex = index % length;
        int mInitialPage = widget.initialCard % length;

        if (widget._pageController.position.haveDimensions) {
          value = widget._pageController.page - index;

          if (value >= 0) {
            double _lowerLimit = widget.percentOfUpperCard;
            double _upperLimit = pi / 2;

            value = (_upperLimit - (value.abs() * (_upperLimit - _lowerLimit)))
                .clamp(_lowerLimit, _upperLimit);
            value = _upperLimit - value;
            value *= -1;
          }
        } else {
          if (mIndex == mInitialPage) {
            //This will show that card fully
            value = 0;
          } else if (mInitialPage == 0 || mIndex == mInitialPage - 1) {
            //This will show the upper card with the percentage specified
            value = -(pi / 2 - widget.percentOfUpperCard);
          } else if (mIndex == mInitialPage + 1) {
            //This will be fixed
            value = -1;
          } else {
            //This will hide the other cards
            value = pi / 2;
          }
        }

        return Center(
          child: Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateX(value),
            alignment: Alignment.center,
            child: child,
          ),
        );
      },
      child: GestureDetector(
        onTap: () {
          print('i am clicked:'+index.toString());
          setState(() {
            if(widget.creditCards[index%length].showBackView) {
              print('print 1');

              widget.creditCards[index % length].showBackView=true;
              widget.creditCards[index % length].Acontroller.forward();
            }else {
              print('print 2');
              widget.creditCards[index % length].Acontroller.reverse();
            }
          });

          // creditCards[index%length].showBackView=!creditCards[index%length].showBackView;

          // onCardClicked?.call(index % length);
        },
        child: widget.creditCards[index % length],
      ),
    );
  }
}
