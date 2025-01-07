import 'package:flutter/material.dart';

import '../../../../config/extensions/date_extension.dart';
import '../../../../config/style/app_decoration.dart';
import '../../../../config/style/app_text_style.dart';
import '../../domain/entities/quote_data.dart';

class QuoteCard extends StatelessWidget {
  const QuoteCard(this.quoteData, {super.key});
  final QuoteData quoteData;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecoration.quoteCardDec,
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(quoteData.title,
              style: AppTextStyle.quoteCardContent,
              textAlign: TextAlign.center),
          const Divider(endIndent: 30, indent: 30),
          Text(quoteData.body, textAlign: TextAlign.justify),
          Text(DateExtension.now.toLocal().format(),
              style: AppTextStyle.darkGreySize12, textAlign: TextAlign.left)
        ],
      ),
    );
  }
}
