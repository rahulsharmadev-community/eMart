import 'package:flutter/material.dart';
import 'package:jars/jars.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var children = [
      Row(
        children: [
          const Text('Product ID:', semanticsLabel: 'Product Identifier').bold,
          12.gap,
          const Text('861JGHYW461912976'),
        ],
      ),
      JTextField(
        labelText: 'Product Name',
        hintText: 'eg. Apple iPhone 12 Pro Max',
        helperText: 'Provide a title for the product that may be customer facing',
      ),
      JTextField(
        readOnly: true,
        labelText: 'Select Product Category',
        hintText: 'eg. Smartphones',
        helperText: 'Select the appropriate product category that best suits the item',
      ),
      JTextField(
        labelText: 'Brand Name (Optional)',
        hintText: 'eg. Apple',
        counter: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                    'Name of the brand under which products are sold. '
                    'Usually mentioned on product or package. In case name is not mentioned, '
                    'kindly leave it blank.',
                    style: context.textTheme.labelMedium)
                .tightFit(),
            24.gap,
            InkWell(
              onTap: () {},
              child: const Text('Learn more about the brand name policy').color(Colors.blue),
            )
          ],
        ),
      ),
      const VariationInputField()
    ];
    return Column(
      children: [
        for (var child in children) ...[
          child,
          24.gap,
        ]
      ],
    );
  }
}

class VariationInputField extends StatefulWidget {
  const VariationInputField({
    super.key,
  });

  @override
  State<VariationInputField> createState() => _VariationInputFieldState();
}

class _VariationInputFieldState extends State<VariationInputField> {
  late bool _hasVariations;
  String? _selectedVariant;
  @override
  void initState() {
    _hasVariations = false;
    super.initState();
  }

  void toggle(value) => setState(() => _hasVariations = value);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Text('Variations:', style: context.textTheme.bodyLarge).bold,
            4.gap,
            Checkbox.adaptive(
              value: _hasVariations,
              onChanged: toggle,
              // Customize the checkbox appearance here if needed
            ),
            4.gap,
            const Text('This product has variations'),
          ],
        ),
        AnimatedCrossFade(
          crossFadeState: CrossFadeState.values[_hasVariations ? 1 : 0],
          duration: kThemeAnimationDuration,
          alignment: Alignment.center,
          firstChild: const SizedBox.shrink(),
          secondChild: _inputField(),
        )
      ],
    );
  }

  var data = {
    {'type': 'Pattern', 'id': '861JGHYWKJ30FD8902', 'label': 'Red'},
    {'type': 'Color', 'id': '861JGHYWKJ30FD8902', 'label': 'Red'},
    {'type': 'Style', 'id': '861JGHYWKJ30FD8902', 'label': 'Red'},
  };
  var list = [
    'Pattern',
    'Color',
    'Style',
    'Size',
  ];

  Widget _inputField() {
    return Padding(
        padding: (4, 0).edgesSymmetric,
        child: Column(
          children: [
            Row(
              children: [
                Material(
                  child: DropdownButtonFormField<String>(
                    hint: const Text('Select a variation type'),
                    borderRadius: 8.rounded,
                    value: _selectedVariant,
                    items: list.map((e) => DropdownMenuItem<String>(value: e, child: Text(e))).toList(),
                    onChanged: (value) => setState(() => _selectedVariant = value),
                  ),
                ).tightFit(),
                32.gap,
                JTextField(
                  labelText: 'Variant Product ID',
                  hintText: 'eg. 861JGHYWKJ30FD8902',
                  borderConfig: InputBorderConfig.underline(),
                ).tightFit(),
                32.gap,
                JTextField(
                  labelText: '${_selectedVariant ?? ''} Label',
                  hintText: 'eg. Red',
                  borderConfig: InputBorderConfig.underline(),
                ).tightFit()
              ],
            ),
            8.gap,
            Text(
                'Variants are a group of similar items that only differ from one another on specific product details, '
                'such as size. Select “yes” if you are listing different variants of this product, to ensure that your '
                'product and its variants are displayed as a group on the website, making it easier for customers to find.',
                style: context.textTheme.labelMedium),
            Align(
                alignment: Alignment.centerRight,
                child: FilledButton(onPressed: () {}, child: const Text('Add Variant'))),
            Wrap(
              children: [],
            )
          ],
        ));
  }
}
