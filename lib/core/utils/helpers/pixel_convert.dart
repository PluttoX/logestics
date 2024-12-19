import 'package:flutter/material.dart';

/// Converts physical pixels to logical pixels
double physicalToLogical(BuildContext context, double physicalPixels) {
  final dpr = MediaQuery.devicePixelRatioOf(context);
  return physicalPixels / dpr;
}

/// Converts logical pixels to physical pixels
double logicalToPhysical(BuildContext context, double logicalPixels) {
  final dpr = MediaQuery.devicePixelRatioOf(context);
  return logicalPixels * dpr;
}
