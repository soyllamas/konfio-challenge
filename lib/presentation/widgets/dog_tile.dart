import 'package:flutter/material.dart';
import 'package:konfio_challenge/util/build_context_extension.dart';

class DogTile extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String description;
  final int years;

  const DogTile({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.years,
  });

  @override
  Widget build(BuildContext context) {
    final fontSize = context.textTheme.bodyMedium!.fontSize!;
    final lineHeight = context.textTheme.bodyMedium!.height!;
    final maxHeight = fontSize * lineHeight * 3;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Card(
            margin: EdgeInsets.zero,
            child: Row(
              children: [
                Flexible(
                  flex: 1,
                  child: Container(),
                ),
                Flexible(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: context.textTheme.headlineSmall,
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          height: maxHeight,
                          child: Text(
                            description,
                            style: context.textTheme.bodyMedium?.copyWith(
                              color: context.colorScheme.secondary,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Almost $years Years',
                          style: context.textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Flexible(
                flex: 1,
                child: AspectRatio(
                  aspectRatio: 2 / 3,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, chunk) {
                        return ColoredBox(
                          color: Color.lerp(
                            context.colorScheme.secondary,
                            context.colorScheme.surface,
                            0.5,
                          )!,
                          child: child,
                        );
                      },
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: Container(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
