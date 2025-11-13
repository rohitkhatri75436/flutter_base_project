
import '../../router/export.dart';

class IntlPhoneFieldWidget extends StatefulWidget {
  final String initialValue;
  final String? countryDialingCode; // Parameter for country dialing code like +61
  final Function(String, String) onChanged;
  final bool isRequired;

  const IntlPhoneFieldWidget({
    super.key,
    required this.initialValue,
    this.countryDialingCode, // Optional dialing code parameter
    required this.onChanged,
    this.isRequired = false,
  });

  @override
  State<IntlPhoneFieldWidget> createState() => _IntlPhoneFieldWidgetState();
}

class _IntlPhoneFieldWidgetState extends State<IntlPhoneFieldWidget> {
  // Function to convert dialing code to country code
  String getCountryCodeFromDialingCode(String? dialingCode) {
    // If no dialing code is provided, return default 'AU'
    if (dialingCode == null || dialingCode.isEmpty) {
      return 'AU';
    }

    // Remove '+' if present
    String code = dialingCode.startsWith('+') ? dialingCode.substring(1) : dialingCode;

    return CountryCode().dialingToCountryCode[code] ?? 'AU';
  }

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      showCountryFlag: false,
      initialCountryCode: getCountryCodeFromDialingCode(widget.countryDialingCode),
      disableLengthCheck: false,
      showDropdownIcon: true,
      dropdownIconPosition: IconPosition.trailing,
      keyboardType: TextInputType.number,
      dropdownDecoration: BoxDecoration(
        border: Border(
          right: BorderSide(
            color: AppColors.border,
            width: 1.5,
          ),
        ),
      ),
      initialValue: widget.initialValue,
      flagsButtonMargin: EdgeInsets.only(right: 6.w),
      cursorColor: AppColors.primary,
      validator: widget.isRequired ? (e) => Validator.validateMobile(e?.number.toString()) : null,
      onChanged: (phone) {
        widget.onChanged(phone.number, phone.countryCode);
      },
      decoration: InputDecoration(
        fillColor: AppColors.white,
        filled: true,
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.white),
          borderRadius: BorderRadius.circular(30.r),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.white),
          borderRadius: BorderRadius.circular(30.r),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.white),
          borderRadius: BorderRadius.circular(30.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.white),
          borderRadius: BorderRadius.circular(30.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.white),
          borderRadius: BorderRadius.circular(30.r),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
        counter: SizedBox.shrink(),
      ),
    );
  }
}
