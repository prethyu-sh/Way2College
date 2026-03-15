import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';

class PaymentSuccessScreen extends StatefulWidget {
  final String transactionId;
  final String amount;
  
  const PaymentSuccessScreen({
    super.key,
    required this.transactionId,
    this.amount = "3000.00",
  });

  @override
  State<PaymentSuccessScreen> createState() => _PaymentSuccessScreenState();
}

class _PaymentSuccessScreenState extends State<PaymentSuccessScreen> {
  bool _isExporting = false;

  Future<void> _generateAndDownloadReceipt() async {
    setState(() => _isExporting = true);

    try {
      final pdf = pw.Document();

      pdf.addPage(
        pw.Page(
          build: (pw.Context context) {
            return pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Center(
                  child: pw.Text("Way2College", style: pw.TextStyle(fontSize: 32, fontWeight: pw.FontWeight.bold)),
                ),
                pw.SizedBox(height: 10),
                pw.Center(
                  child: pw.Text("Official Payment Receipt", style: const pw.TextStyle(fontSize: 20)),
                ),
                pw.SizedBox(height: 30),
                pw.Divider(),
                pw.SizedBox(height: 20),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text("Transaction ID:", style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 16)),
                    pw.Text(widget.transactionId, style: const pw.TextStyle(fontSize: 16)),
                  ],
                ),
                pw.SizedBox(height: 10),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text("Date:", style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 16)),
                    pw.Text(DateTime.now().toString().split('.')[0], style: const pw.TextStyle(fontSize: 16)),
                  ],
                ),
                pw.SizedBox(height: 10),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text("Description:", style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 16)),
                    pw.Text("Student Bus Pass Fee", style: const pw.TextStyle(fontSize: 16)),
                  ],
                ),
                pw.SizedBox(height: 10),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text("Amount Paid:", style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 16)),
                    pw.Text("Rs.${widget.amount}", style: const pw.TextStyle(fontSize: 16)),
                  ],
                ),
                pw.SizedBox(height: 30),
                pw.Divider(),
                pw.SizedBox(height: 20),
                pw.Center(
                  child: pw.Text("Thank you for your payment!", style: pw.TextStyle(fontStyle: pw.FontStyle.italic, fontSize: 14)),
                )
              ],
            );
          },
        ),
      );

      final output = await getExternalStorageDirectory() ?? await getApplicationDocumentsDirectory();
      final file = File("${output.path}/BusPass_Receipt_${widget.transactionId}.pdf");
      await file.writeAsBytes(await pdf.save());

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Receipt Downloaded to ${file.path}')),
      );
      
      OpenFile.open(file.path);

    } catch (e) {
      debugPrint("Error generating PDF: $e");
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to generate receipt')),
        );
      }
    } finally {
      if (mounted) setState(() => _isExporting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Payment Successful"),
        backgroundColor: const Color(0xFF0B5C43),
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false, // Prevent simple back button, user should use Done
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.check_circle,
                color: Color(0xFF0B5C43),
                size: 100,
              ),
              const SizedBox(height: 24),
              const Text(
                "Payment Successful!",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0B5C43),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "Your payment of ₹${widget.amount} was processed successfully.",
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, color: Colors.black87),
              ),
              const SizedBox(height: 8),
              Text(
                "Transaction ID: ${widget.transactionId}",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.grey.shade600, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 48),
              
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: _isExporting ? null : _generateAndDownloadReceipt,
                  icon: _isExporting 
                    ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                    : const Icon(Icons.download, color: Colors.white),
                  label: Text(
                    _isExporting ? "Generating..." : "Download Receipt",
                    style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0B5C43),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: 16),
              
              SizedBox(
                width: double.infinity,
                height: 50,
                child: OutlinedButton(
                  onPressed: () {
                    // Navigate completely back to the Dashboard
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xFF0B5C43), width: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Back to Dashboard",
                    style: TextStyle(
                      color: Color(0xFF0B5C43),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
