import 'package:flutter/material.dart';

class RequestServiceScreen extends StatefulWidget {
  const RequestServiceScreen({super.key});

  @override
  State<RequestServiceScreen> createState() => _RequestServiceScreenState();
}

class _RequestServiceScreenState extends State<RequestServiceScreen> {
  // State variables for the form
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  String _description = '';
  final _descriptionController = TextEditingController();

  // Highlighted index for the bottom navigation bar (Bookings is index 2)
  int _currentIndex = 2;

  // Color Constants (based on HTML/Tailwind)
  static const Color darkBackground = Color(0xFF111618);
  static const Color inputBackground = Color(0xFF283339);
  static const Color inactiveText = Color(0xFF9DB0B9);
  static const Color primaryBlue = Color(0xFF13A4EC);
  static const Color navBarColor = Color(0xFF1C2327);
  static const Color navBarBorder = Color(0xFF283339);

  @override
  void initState() {
    super.initState();
    _descriptionController.addListener(() {
      _description = _descriptionController.text;
    });
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  // --- Date and Time Pickers ---

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 5),
      builder: (context, child) {
        // Apply custom theme to the picker
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.dark(
              primary: primaryBlue,
              onPrimary: Colors.white,
              surface: inputBackground,
              onSurface: Colors.white,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(foregroundColor: primaryBlue),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
      builder: (context, child) {
        // Apply custom theme to the picker
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.dark(
              primary: primaryBlue,
              onPrimary: Colors.white,
              surface: inputBackground,
              onSurface: Colors.white,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(foregroundColor: primaryBlue),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  void _submitRequest() {
    if (_selectedDate == null ||
        _selectedTime == null ||
        _description.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please select a date, time, and describe your service needs.',
          ),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    // Placeholder for Firestore save logic
    print('Service Requested:');
    print('Date: $_selectedDate');
    print('Time: $_selectedTime');
    print('Description: $_description');

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Service request submitted successfully!'),
        backgroundColor: primaryBlue,
      ),
    );
  }

  // --- UI Components ---

  Widget _buildFormField({
    required String hintText,
    required VoidCallback onTap,
    required Widget icon,
    String? displayValue,
  }) {
    return Expanded(
      child: TextFormField(
        readOnly: true,
        onTap: onTap,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: inactiveText),
          filled: true,
          fillColor: inputBackground,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 0,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none,
          ),
          suffixIcon: icon,
        ),
        style: const TextStyle(color: Colors.white, fontSize: 16),
        controller: TextEditingController(text: displayValue),
      ),
    );
  }

  Widget _buildBottomNavBar(BuildContext context) {
    const Color inactiveColor = inactiveText;
    const Color activeColor = Colors.white;

    return Container(
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: navBarBorder, width: 1.0)),
        color: navBarColor,
      ),
      padding: EdgeInsets.only(
        top: 8.0,
        bottom: 8.0 + MediaQuery.of(context).padding.bottom,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(
            context,
            Icons.home_outlined,
            Icons.home,
            'Home',
            0,
            inactiveColor,
            activeColor,
          ),
          _buildNavItem(
            context,
            Icons.list_outlined,
            Icons.list,
            'Categories',
            1,
            inactiveColor,
            activeColor,
          ),
          _buildNavItem(
            context,
            Icons.calendar_today_outlined,
            Icons.calendar_today,
            'Bookings',
            2,
            inactiveColor,
            activeColor,
          ),
          _buildNavItem(
            context,
            Icons.person_outline,
            Icons.person,
            'Profile',
            3,
            inactiveColor,
            activeColor,
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context,
    IconData icon,
    IconData activeIcon,
    String label,
    int index,
    Color inactiveColor,
    Color activeColor,
  ) {
    final bool isActive = _currentIndex == index;
    final Color color = isActive ? activeColor : inactiveColor;

    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() {
            _currentIndex = index;
          });
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(isActive ? activeIcon : icon, color: color, size: 24),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String dateDisplay = _selectedDate == null
        ? null.toString()
        : '${_selectedDate!.month}/${_selectedDate!.day}/${_selectedDate!.year}';

    String timeDisplay = _selectedTime == null
        ? null.toString()
        : _selectedTime!.format(context);

    return Scaffold(
      backgroundColor: darkBackground,
      appBar: AppBar(
        backgroundColor: darkBackground,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          'Request Service',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white, size: 24),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Text(
                'When do you need the service?',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 12.0,
              ),
              child: Row(
                children: [
                  _buildFormField(
                    hintText: 'Select Date',
                    onTap: () => _selectDate(context),
                    icon: Icon(Icons.calendar_today, color: inactiveText),
                    displayValue: dateDisplay == 'null' ? null : dateDisplay,
                  ),
                  const SizedBox(width: 16),
                  _buildFormField(
                    hintText: 'Select Time',
                    onTap: () => _selectTime(context),
                    icon: Icon(Icons.access_time, color: inactiveText),
                    displayValue: timeDisplay == 'null' ? null : timeDisplay,
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 24, 16, 8),
              child: Text(
                'What do you need help with?',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 12.0,
              ),
              child: TextFormField(
                controller: _descriptionController,
                maxLines: 6,
                minLines: 4,
                decoration: InputDecoration(
                  hintText: 'Describe your project',
                  hintStyle: const TextStyle(color: inactiveText),
                  filled: true,
                  fillColor: inputBackground,
                  contentPadding: const EdgeInsets.all(16.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 16.0,
              ),
              child: ElevatedButton(
                onPressed: _submitRequest,
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryBlue,
                  minimumSize: const Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  elevation: 0,
                ),
                child: const Text(
                  'Request Service',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.2,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
    );
  }
}
