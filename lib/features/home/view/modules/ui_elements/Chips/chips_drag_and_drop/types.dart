enum Panel { upper, lower }

typedef PanelLoction = (int, Panel);

extension CopyablePanelLocation on PanelLoction {
  PanelLoction copyWith({int? index, Panel? panel}) =>
      (index ?? this.$1, panel ?? this.$2);
}
