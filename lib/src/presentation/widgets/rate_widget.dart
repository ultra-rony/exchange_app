import 'package:cached_network_image/cached_network_image.dart';
import 'package:exchange_app/core/extensions/currency_formatter_extension.dart';
import 'package:exchange_app/core/utils/constants.dart';
import 'package:flutter/material.dart';

class RateWidget extends StatelessWidget {
  final String? symbol;
  final String? price;

  const RateWidget({super.key, this.symbol, this.price});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: CachedNetworkImage(
                    imageUrl: Constants.iconUrl.replaceAll(
                      "XXX",
                      (symbol ?? "").toLowerCase(),
                    ),
                    fit: BoxFit.fill,
                    errorWidget:
                        (context, url, error) => const Icon(Icons.error),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  symbol ?? "",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  "\$${(price ?? "").limitDecimalPlaces()}",
                  textAlign: TextAlign.right,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            height: 0.5,
            color: Theme.of(context).textTheme.headlineLarge?.color,
          ),
        ],
      ),
    );
  }
}
