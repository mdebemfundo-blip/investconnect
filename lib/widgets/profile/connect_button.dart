import 'package:flutter/material.dart';
import '../../models/connection_status.dart';

class ConnectButton extends StatelessWidget {
  final ConnectionStatus status;
  final VoidCallback onPressed;

  const ConnectButton({
    super.key,
    required this.status,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    String text;
    Color color;
    IconData icon;

    switch (status) {
      case ConnectionStatus.following:
        text = "Following";
        color = Colors.grey.shade300;
        icon = Icons.check;
        break;
      case ConnectionStatus.requested:
        text = "Requested";
        color = Colors.orange.shade300;
        icon = Icons.hourglass_top;
        break;
      case ConnectionStatus.connected:
        text = "Connected";
        color = Colors.green.shade400;
        icon = Icons.handshake;
        break;
      default:
        text = "Connect";
        color = Colors.blue;
        icon = Icons.person_add;
    }

    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 18),
      label: Text(text),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
    );
  }
}
