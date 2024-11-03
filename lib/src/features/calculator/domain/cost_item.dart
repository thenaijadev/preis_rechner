// ignore_for_file: public_member_api_docs, sort_constructors_first
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

  CostItem copyWith({
    String? label,
    String? costType,
    double? price,
    String? comment,
  }) {
    return CostItem(
      label: label ?? this.label,
      costType: costType ?? this.costType,
      price: price ?? this.price,
      comment: comment ?? this.comment,
    );
  }
}
