import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetingreminder/app/modules/homepage/controllers/timepicker_controller.dart';

final timePickerController = Get.find<TimePickerController>();

Widget buildReminderBox(BuildContext context) {
  return Dialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    child: Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Color(0xFFFFE5E5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(Icons.event, color: Color(0xFF9B4DCA), size: 24),
              ),
              const SizedBox(width: 12),
              const Text(
                'New Meeting',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2B3A67),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          
          // Meeting Type Input
          const Text(
            'Meeting Type',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFF2B3A67),
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: timePickerController.remarkController.value,
            decoration: InputDecoration(
              hintText: 'Meeting Type (Optional)',
              hintStyle: TextStyle(
                color: Colors.grey[400],
                fontSize: 14,
              ),
              filled: true,
              fillColor: Color(0xFFFFF4E3),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Color(0xFFFFB347),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Color(0xFFFFB347),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Color(0xFF9B4DCA),
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Date Selection
          const Text(
            'Meeting Date',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFF2B3A67),
            ),
          ),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: () => timePickerController.dateSetter(context),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Color(0xFFFFE5E5),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Color(0xFF9B4DCA).withOpacity(0.3)),
              ),
              child: Row(
                children: [
                  Icon(Icons.calendar_today, color: Color(0xFF9B4DCA), size: 20),
                  const SizedBox(width: 8),
                  Obx(() => Text(
                    timePickerController.formattedDate.value.isEmpty
                        ? 'Select date'
                        : timePickerController.formattedDate.value,
                    style: TextStyle(
                      color: Color(0xFF9B4DCA),
                      fontWeight: FontWeight.w600,
                    ),
                  )),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          
          // Time Selection
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Start Time',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF2B3A67),
                      ),
                    ),
                    const SizedBox(height: 8),
                    GestureDetector(
                      onTap: () => timePickerController.meetingSetter(context, true),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Color(0xFFFFE5E5),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Color(0xFF9B4DCA).withOpacity(0.3)),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.access_time, color: Color(0xFF9B4DCA), size: 20),
                            const SizedBox(width: 8),
                            Obx(() => Text(
                              timePickerController.startTime.value.isEmpty
                                  ? 'Select time'
                                  : timePickerController.startTime.value,
                              style: TextStyle(
                                color: Color(0xFF9B4DCA),
                                fontWeight: FontWeight.w600,
                              ),
                            )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'End Time',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF2B3A67),
                      ),
                    ),
                    const SizedBox(height: 8),
                    GestureDetector(
                      onTap: () => timePickerController.meetingSetter(context, false),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Color(0xFFFFE5E5),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Color(0xFF9B4DCA).withOpacity(0.3)),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.access_time, color: Color(0xFF9B4DCA), size: 20),
                            const SizedBox(width: 8),
                            Obx(() => Text(
                              timePickerController.endTime.value.isEmpty
                                  ? 'Select time'
                                  : timePickerController.endTime.value,
                              style: TextStyle(
                                color: Color(0xFF9B4DCA),
                                fontWeight: FontWeight.w600,
                              ),
                            )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          
          // Action Buttons
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () => timePickerController.clearTimes(),
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    timePickerController.storeMeetingData();
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Color(0xFF9B4DCA),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Create Meeting',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
