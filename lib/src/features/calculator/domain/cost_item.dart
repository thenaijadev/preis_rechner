class CostItem {
  String? label;
  String? costType;
  double? price;
  String? comment;

  CostItem({
    this.label,
    this.costType,
    this.price,
    this.comment,
  });

  Map<String, dynamic> toMap() {
    return {
      'label': label,
      'costType': costType,
      'price': price,
      'comment': comment,
    };
  }
}
