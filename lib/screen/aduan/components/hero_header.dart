import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/sliver_persistent_header.dart';
import 'package:sibeluapp/models/aduan/aduan_body.dart';

class HeroHeader implements SliverPersistentHeaderDelegate {
  final VoidCallback onLayoutToggle;
  double maxExtent;
  double minExtent;
  AduanBody data;

  HeroHeader({this.onLayoutToggle, this.maxExtent, this.minExtent, this.data});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      overflow: Overflow.visible,
      fit: StackFit.expand,
      children: [
        Image.asset(
          'assets/img/Magical_World.png',
          fit: BoxFit.cover,
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.transparent,
                Colors.black54,
              ],
              stops: [0.5, 1.0],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.repeated,
            ),
          ),
        ),
        Positioned(
          left: 4.0,
          top: 4.0,
          child: SafeArea(
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: onLayoutToggle,
            ),
          ),
        ),
        Positioned(
          left: 16.0,
          right: 16.0,
          bottom: 16.0,
          child: Text(
            data.jenisAduan,
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        Positioned(
          bottom: -20,
          right: 16,
          child: data.statusTL == 'SELESAI'
              ? Icon(
                  Icons.check_circle,
                  size: 50,
                  color: Color(0xFF48A500),
                )
              : Icon(
                  Icons.pending_rounded,
                  size: 50,
                  color: Colors.pinkAccent,
                ),
        )
      ],
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  FloatingHeaderSnapConfiguration get snapConfiguration => null;

  @override
  OverScrollHeaderStretchConfiguration get stretchConfiguration =>
      OverScrollHeaderStretchConfiguration();

  @override
  PersistentHeaderShowOnScreenConfiguration get showOnScreenConfiguration =>
      throw UnimplementedError();

  @override
  TickerProvider get vsync => throw UnimplementedError();
}
