import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:properties/core/helpers/image_processors.dart';
import 'package:properties/features/properties/model/property_detail.dart';
import 'package:properties/features/properties/model/property_model.dart';
import 'package:properties/navigation/app_paths.dart';
import 'package:properties/resource/app_colors.dart';
import 'package:properties/resource/app_dimen.dart';
import 'package:properties/resource/app_utils.dart';

class PropertyCard extends StatelessWidget {
  const PropertyCard({
    super.key,
    required this.property,
  });
  final PropertyModel property;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 0.2,
        color: Colors.white,
        margin: const EdgeInsets.only(top: 16),
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
        child: PropertyWidget(property: property));
  }
}

class PropertyWidget extends StatelessWidget {
  const PropertyWidget({
    super.key,
    required this.property,
    this.swipable = false,
  });
  final PropertyModel property;
  final bool swipable;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return InkWell(
        onTap: !swipable
            ? () {
                GoRouter.of(context).goNamed(
                  AppPath.propertyDetailPath,
                  extra: property,
                );
              }
            : null,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: size.width,
                      padding: const EdgeInsets.symmetric(
                        vertical: 16.0,
                        horizontal: 16.0,
                      ),
                      color: const Color(0xFFFFFF00),
                      child: Text(
                        'Abuja Properties',
                        style: theme.textTheme.bodyLarge
                            ?.copyWith(color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      height: size.width - 100,
                      width: size.width,
                      child: swipable
                          ? SwipableImages(imageUrls: property.imageUrls!)
                          : getImageWidget(property.imageUrls![0]),
                    ),
                  ],
                ),
                Positioned(
                  bottom: 10,
                  left: 0,
                  child: Container(
                    padding: const EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        color: AppColor.kAppColor500),
                    child: Text(
                      property.listingType!.toUpperCase(),
                      style: theme.textTheme.labelMedium?.copyWith(
                          fontWeight: FontWeight.w500, color: Colors.white),
                    ),
                  ),
                ),
                if (property.imageUrls!.length > 1 && !swipable) ...[
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(2.0),
                      decoration: const BoxDecoration(color: AppColor.white),
                      child: SizedBox.square(
                        dimension: 150,
                        child: getImageWidget(
                          property.imageUrls![1],
                        ),
                      ),
                    ),
                  ),
                ],
                if (!swipable) ...[
                  const Positioned(
                    top: 5,
                    right: 5,
                    child: CircleAvatar(
                      radius: 35,
                      child: CircleAvatar(
                        radius: 34,
                        backgroundColor: Colors.black,
                        child: Icon(FontAwesomeIcons.user),
                      ),
                    ),
                  ),
                ]
              ],
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        property.price!,
                        softWrap: true,
                        style: theme.textTheme.titleMedium,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.favorite_outline),
                            color: theme.primaryColor,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.more_vert),
                            color: theme.primaryColor,
                          )
                        ],
                      )
                    ],
                  ),

                  RichText(
                    text: TextSpan(
                      text: '${cleanPropertyArea(property)},\t',
                      style: theme.textTheme.labelLarge,
                      children: [
                        TextSpan(
                          text: cleanPropertyState(property),
                          style: theme.textTheme.labelMedium,
                        ),
                      ],
                    ),
                  ),
                  //vertical spacer
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      if (property.detail != null) ...[
                        _buildMiscellanous(property.detail!, theme)
                      ],
                      Text(
                        property.propertyType ?? '',
                        style: theme.textTheme.labelLarge,
                      ),
                    ],
                  ),
                  //vertical spacer
                  const SizedBox(
                    height: 10.0,
                  ),
                  RichText(
                    text: TextSpan(
                      text: property.status,
                      style: theme.textTheme.labelMedium,
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }

  Widget _buildMiscellanous(PropertyDetail detail, ThemeData theme) {
    return Wrap(
      children: [
        if (detail.bedrooms != null) ...[
          Icon(
            Icons.bed_outlined,
            size: 20,
            color: theme.colorScheme.onSurface,
          ),
          Text(
            detail.bedrooms!,
            softWrap: true,
            style: theme.textTheme.labelSmall,
          ),
        ],
        if (detail.bathrooms != null) ...[
          const SizedBox(
            width: 10.0,
          ),
          Icon(
            Icons.bathroom_outlined,
            color: theme.colorScheme.onSurface,
            size: 20,
          ),
          Text(
            detail.bathrooms!,
            softWrap: true,
            style: theme.textTheme.labelSmall,
          ),
        ],
        if (detail.rooms != null) ...[
          const SizedBox(
            width: 10.0,
          ),
          Icon(
            Icons.single_bed_outlined,
            color: theme.colorScheme.onSurface,
            size: 20,
          ),
          Text(
            detail.rooms!,
            softWrap: true,
            style: theme.textTheme.labelSmall,
          ),
        ],
        if (detail.garage != null) ...[
          const SizedBox(
            width: 10.0,
          ),
          Icon(
            Icons.garage,
            color: theme.colorScheme.onSurface,
            size: 20,
          ),
          Text(
            detail.garage!,
            softWrap: true,
            style: theme.textTheme.labelSmall,
          ),
        ],
        if (detail.yearBuilt != null) ...[
          const SizedBox(
            width: 10.0,
          ),
          Icon(
            Icons.calendar_month,
            color: theme.colorScheme.onSurface,
            size: 20,
          ),
          Text(
            detail.yearBuilt!,
            softWrap: true,
            style: theme.textTheme.labelSmall,
          ),
        ],
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            '|',
            style: theme.textTheme.labelMedium,
          ),
        ),
      ],
    );
  }
}

class SwipableImages extends StatefulWidget {
  const SwipableImages({
    super.key,
    required this.imageUrls,
  });
  final List<String> imageUrls;
  @override
  State<SwipableImages> createState() => _SwipableImagesState();
}

class _SwipableImagesState extends State<SwipableImages> {
  final controller = PageController();
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      children: [
        PageView(
          controller: controller,
          children: [
            ...List.generate(widget.imageUrls.length, (index) {
              return getImageWidget(
                widget.imageUrls[index],
              );
            })
          ],
          onPageChanged: (value) {
            setState(() {
              pageIndex = value;
            });
          },
        ),
        Positioned(
          right: 10,
          top: 10,
          child: Container(
            padding: const EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                AppDimen.cardCornerRadius,
              ),
              color: Colors.black54,
            ),
            child: Text(
              '${pageIndex += 1}\tto\t${widget.imageUrls.length}',
              style: theme.textTheme.labelSmall?.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}
