import 'package:flutter/material.dart';
import 'package:overstay_frontend/views/app/widget_tree.dart';
import 'package:overstay_frontend/';

class VisaPage extends StatefulWidget {
  const VisaPage({super.key});

  @override
  State<VisaPage> createState() => _VisaPageState();
}

class _VisaPageState extends State<VisaPage> {
  // Liste til dropdown-menu mockdata
  final List<String> countries = ['Denmark', 'Sweden', 'Norway', 'Germany'];

  final List<String> visaTypes = ['Tourist Visa', 'Student Visa', 'Work Visa'];

  // ValueNotifiers / variable til at gemme brugerens valg
  String? selectedCountry;
  String? selectedVisaType;

  // Tekstcontrollere til at håndtere tekstfelter
  final TextEditingController arrivalDateController = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialiserer expiryDate feltet med en placeholder
    expiryDateController.text = "dd/mm/yyyy";
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Venstre side (gradient + form)
        Expanded(
          flex: 1,
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF99D98C),
                  Color(0xFF76C893),
                  Color(0xFF52B69A),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: _buildVisaForm(context),
          ),
        ),
        // Højre side (billede)
        Expanded(
          flex: 1,
          child: Center(
            child: Image.asset('assets/images/passport.png', width: 250),
          ),
        ),
      ],
    );
  }

  Widget _buildVisaForm(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // "Visa" overskrift
          const Text(
            'Visa',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),

          // "Choose Country" + dropdown
          const Text(
            'Choose Country',
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          const SizedBox(height: 8),
          DropdownButtonFormField<String>(
            decoration: _whiteInputDecoration,
            value: selectedCountry,
            hint: const Text('Select a country'),
            items:
                countries.map((String country) {
                  return DropdownMenuItem<String>(
                    value: country,
                    child: Text(country),
                  );
                }).toList(),
            onChanged: (newValue) {
              setState(() => selectedCountry = newValue);
            },
          ),
          const SizedBox(height: 16),

          // "Check visatype" + dropdown
          const Text(
            'Check visa-type',
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          const SizedBox(height: 8),
          DropdownButtonFormField<String>(
            decoration: _whiteInputDecoration,
            value: selectedVisaType,
            hint: const Text('Select a visa type'),
            items:
                visaTypes.map((String visaType) {
                  return DropdownMenuItem<String>(
                    value: visaType,
                    child: Text(visaType),
                  );
                }).toList(),
            onChanged: (String? newValue) {
              setState(() => selectedVisaType = newValue);
            },
          ),
          const SizedBox(height: 16),

          // "Arrival date" + text field
          const Text(
            'Arrival date',
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: arrivalDateController,
            decoration: _whiteInputDecoration.copyWith(hintText: 'dd/mm/yyyy'),
          ),
          const SizedBox(height: 16),

          // "Expiry date" (read-only)
          const Text(
            'Expiry date',
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: expiryDateController,
            readOnly: true,
            decoration: _whiteInputDecoration,
          ),
          const SizedBox(height: 24),

          // Knapper (Save, Delete)
          Row(
            children: [
              ElevatedButton(
                onPressed: _saveVisa,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1A759F),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                ),
                child: const Text(
                  'Save',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: _deleteVisa,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1A759F),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                ),
                child: const Text(
                  'Delete',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Metode til at gemme visa data
  void _saveVisa() {
    final country = selectedCountry ?? '';
    final visaType = selectedVisaType ?? '';
    final arrivalDate = arrivalDateController.text.trim();
    final expiry = expiryDateController.text.trim();

    // TODO: Kald backend for at gemme data
    debugPrint(
      'Saving: country=$country, visaType=$visaType, arrival=$arrivalDate, expiry=$expiry',
    );
  }

  // Metode til at slette data
  void _deleteVisa() {
    // TODO: Kald backend for at slette data
    debugPrint('Deleting visa data');
  }
}

// "white box" stil
final InputDecoration _whiteInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide.none,
  ),
);
